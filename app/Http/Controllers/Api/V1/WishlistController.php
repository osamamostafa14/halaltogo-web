<?php

namespace App\Http\Controllers\Api\V1;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\Wishlist;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\CentralLogics\OrderLogic;

class WishlistController extends Controller
{
    public function add_to_wishlist(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'food_id' => 'required_without:restaurant_id',
            'restaurant_id' => 'required_without:food_id',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }
        if ($request->food_id && $request->restaurant_id) {
            $errors = [];
            array_push($errors, ['code' => 'data', 'message' => translate('messages.can_not_add_both_food_and_restaurant_at_same_time')]);
            return response()->json([
                'errors' => $errors
            ], 403);
        }
        $wishlist = Wishlist::where('user_id', $request?->user()?->id)->where('food_id', $request->food_id)->where('restaurant_id', $request->restaurant_id)->first();
        if (empty($wishlist)) {
            $wishlist = new Wishlist;
            $wishlist->user_id = $request?->user()?->id;
            $wishlist->food_id = $request->food_id;
            $wishlist->restaurant_id = $request->restaurant_id;
            $wishlist->save();
            return response()->json(['message' => translate('messages.added_successfully')], 200);
        }

        return response()->json(['message' => translate('messages.already_in_wishlist')], 409);
    }

    public function remove_from_wishlist(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'food_id' => 'required_without:restaurant_id',
            'restaurant_id' => 'required_without:food_id',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $wishlist = Wishlist::when($request->food_id, function($query)use($request){
            return $query->where('food_id', $request->food_id);
        })
        ->when($request->restaurant_id, function($query)use($request){
            return $query->where('restaurant_id', $request->restaurant_id);
        })
        ->where('user_id', $request?->user()?->id)->first();

        if ($wishlist) {
            $wishlist?->delete();
            return response()->json(['message' => translate('messages.successfully_removed')], 200);

        }
        return response()->json(['message' => translate('messages.not_found')], 404);
    }

    public function wish_list(Request $request)
    {
        // if (!$request->hasHeader('zoneId')) {
        //     $errors = [];
        //     array_push($errors, ['code' => 'zoneId', 'message' => 'Zone id is required!']);
        //     return response()->json([
        //         'errors' => $errors
        //     ], 403);
        // }
        $zone_id= $request->hasHeader('zoneId')? json_decode($request->header('zoneId'), true) : [1];
        $longitude= $request->header('longitude');
        $latitude= $request->header('latitude');
        $wishlists = Wishlist::where('user_id', $request?->user()?->id)->with(['food'=>function($q)use($zone_id){
            return $q->whereHas('restaurant', function($q)use($zone_id){
                $q->whereIn('zone_id', $zone_id);
            });
        }, 'restaurant'=>function($q)use($zone_id,$longitude,$latitude){
            return $q->withOpen($longitude,$latitude)->whereIn('zone_id', $zone_id);
        }])
        ->get();
        $wishlists = Helpers::wishlist_data_formatting(data:$wishlists,multi_data: true);
        OrderLogic::check_subscription($request->user());
        return response()->json($wishlists, 200);
    }
}
