<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Food;
use App\Models\Category;
use Illuminate\Http\Request;
use App\CentralLogics\Helpers;
use App\CentralLogics\CategoryLogic;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class CategoryController extends Controller
{
    public function get_categories(Request $request)
    {
        try {
            $zone_id=  $request->header('zoneId') ? json_decode($request->header('zoneId'), true) : [];
            $name= $request->query('name');
            $categories = Category::withCount(['products','childes'])->with(['childes' => function($query)  {
                $query->withCount(['products','childes']);
            }])
            ->where(['position'=>0,'status'=>1])

            ->when($name, function($q)use($name){
                $key = explode(' ', $name);
                $q->where(function($q)use($key){
                    foreach ($key as $value){
                        $q->orWhere('name', 'like', '%'.$value.'%')->orWhere('slug', 'like', '%'.$value.'%');
                    }
                    return $q;
                });
            })
            ->orderBy('priority','desc')->get();



            if(count($zone_id) > 0){
                foreach ($categories as $category) {
                        $productCount = Food::active()
                        ->whereHas('restaurant', function ($query) use ($zone_id) {
                            $query->whereIn('zone_id', $zone_id);
                        })
                        ->whereHas('category',function($q)use($category){
                            return $q->whereId($category->id)->orWhere('parent_id', $category->id);
                        })
                        ->count();
                        $category['products_count'] = $productCount;
                    unset($category['childes']);
                }
                return response()->json($categories, 200);
            }

            return response()->json(Helpers::category_data_formatting($categories, true), 200);
        } catch (\Exception $e) {
            return response()->json([$e->getMessage()]);
        }
    }

    public function get_childes($id)
    {
        try {
            $categories = Category::when(is_numeric($id),function ($qurey) use($id){
                $qurey->where(['parent_id' => $id,'status'=>1]);
                })
                ->when(!is_numeric($id),function ($qurey) use($id){
                    $qurey->where(['slug' => $id,'status'=>1]);
                })
            ->orderBy('priority','desc')->get();
            return response()->json(Helpers::category_data_formatting($categories, true), 200);
        } catch (\Exception $e) {
            return response()->json([$e->getMessage()], 200);
        }
    }

    public function get_products($id, Request $request)
    {
        // if (!$request->hasHeader('zoneId')) {
        //     $errors = [];
        //     array_push($errors, ['code' => 'zoneId', 'message' => translate('messages.zone_id_required')]);
        //     return response()->json([
        //         'errors' => $errors
        //     ], 403);
        // }
        $validator = Validator::make($request->all(), [
            'limit' => 'required',
            'offset' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $zone_id= $request->hasHeader('zoneId')? json_decode($request->header('zoneId'), true) : [1];

        $type = $request->query('type', 'all');

        $data = CategoryLogic::products(category_id:$id,zone_id: $zone_id, limit:$request['limit'], offset:$request['offset'], type:$type);
        $data['products'] = Helpers::product_data_formatting($data['products'] , true, false, app()->getLocale());

        if(auth('api')->user() !== null){
            $customer_id =auth('api')->user()->id;
            Helpers::visitor_log('category',$customer_id,$id,false);
        }

        return response()->json($data, 200);
    }


    public function get_restaurants($id, Request $request)
    {
        // if (!$request->hasHeader('zoneId')) {
        //     $errors = [];
        //     array_push($errors, ['code' => 'zoneId', 'message' => translate('messages.zone_id_required')]);
        //     return response()->json([
        //         'errors' => $errors
        //     ], 403);
        // }
        $validator = Validator::make($request->all(), [
            'limit' => 'required',
            'offset' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $zone_id= $request->hasHeader('zoneId')? json_decode($request->header('zoneId'), true) : [1];

        $type = $request->query('type', 'all');

        $data = CategoryLogic::restaurants(category_id:$id,zone_id: $zone_id,limit: $request['limit'], offset:$request['offset'], type:$type);
        $data['restaurants'] = Helpers::restaurant_data_formatting($data['restaurants'] , true);

        // if(auth('api')->user() !== null){
        //     $customer_id =auth('api')->user()->id;
        //     Helpers::visitor_log('category',$customer_id,$id,false);
        // }

        return response()->json($data, 200);
    }



    public function get_all_products($id,Request $request)
    {
        try {
            return response()->json(Helpers::product_data_formatting(CategoryLogic::all_products($id), true, false, app()->getLocale()), 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }
}
