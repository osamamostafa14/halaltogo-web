<?php

use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'Admin', 'as' => 'admin.'], function () {
    
    Route::group(['middleware' => ['admin']], function () {

        Route::get('lang/{locale}', 'LanguageController@lang')->name('lang');
        Route::get('settings', 'SystemController@settings')->name('settings');
        Route::post('settings', 'SystemController@settings_update');
        Route::post('settings-password', 'SystemController@settings_password_update')->name('settings-password');
        Route::get('/get-restaurant-data', 'SystemController@restaurant_data')->name('get-restaurant-data');
        Route::post('/update-fcm-toke', 'SystemController@update_fcm_token')->name('update-fcm');

        //dashboard
        Route::get('/', 'DashboardController@dashboard')->name('dashboard');
        Route::get('landing-page', 'SystemController@landing_page')->name('landing-page');

        Route::resource('account-transaction', 'AccountTransactionController')->middleware('module:account');
        Route::get('export-account-transaction', 'AccountTransactionController@export_account_transaction')->name('export-account-transaction');
        Route::post('search-account-transaction', 'AccountTransactionController@search_account_transaction')->name('search-account-transaction');

        Route::resource('provide-deliveryman-earnings', 'ProvideDMEarningController')->middleware('module:provide_dm_earning');
        Route::get('export-deliveryman-earnings', 'ProvideDMEarningController@dm_earning_list_export')->name('export-deliveryman-earning');
        Route::post('deliveryman-earnings-search', 'ProvideDMEarningController@search_deliveryman_earning')->name('search-deliveryman-earning');

        Route::get('maintenance-mode', 'SystemController@maintenance_mode')->name('maintenance-mode');

        Route::group(['prefix' => 'dashboard-stats', 'as' => 'dashboard-stats.'], function () {
            Route::post('order', 'DashboardController@order')->name('order');
            Route::post('zone', 'DashboardController@zone')->name('zone');
            Route::post('user-overview', 'DashboardController@user_overview')->name('user-overview');
            Route::post('business-overview', 'DashboardController@business_overview')->name('business-overview');
        });

        Route::group(['prefix' => 'custom-role', 'as' => 'custom-role.', 'middleware' => ['module:custom_role']], function () {
            Route::get('create', 'CustomRoleController@create')->name('create');
            Route::post('create', 'CustomRoleController@store');
            Route::get('edit/{id}', 'CustomRoleController@edit')->name('edit');
            Route::post('update/{id}', 'CustomRoleController@update')->name('update');
            Route::delete('delete/{id}', 'CustomRoleController@distroy')->name('delete');
            Route::post('search', 'CustomRoleController@search')->name('search');
            Route::get('export-employee-role', 'CustomRoleController@employee_role_export')->name('export-employee-role');
        });

        Route::group(['prefix' => 'employee', 'as' => 'employee.', 'middleware' => ['module:employee']], function () {
            Route::get('add-new', 'EmployeeController@add_new')->name('add-new');
            Route::post('add-new', 'EmployeeController@store');
            Route::get('list', 'EmployeeController@list')->name('list');
            Route::get('update/{id}', 'EmployeeController@edit')->name('edit');
            Route::post('update/{id}', 'EmployeeController@update')->name('update');
            Route::delete('delete/{id}', 'EmployeeController@distroy')->name('delete');
            // Route::post('search', 'EmployeeController@search')->name('search');
            Route::get('export-employee', 'EmployeeController@employee_list_export')->name('export-employee');
        });
        Route::post('food/food-variation-generate', 'FoodController@food_variation_generator')->name('food.food-variation-generate');
        Route::post('food/variant-price', 'FoodController@variant_price')->name('food.variant-price');
        Route::group(['prefix' => 'food', 'as' => 'food.', 'middleware' => ['module:food']], function () {
            Route::get('add-new', 'FoodController@index')->name('add-new');
            Route::post('variant-combination', 'FoodController@variant_combination')->name('variant-combination');
            Route::post('store', 'FoodController@store')->name('store');
            Route::get('edit/{id}', 'FoodController@edit')->name('edit');
            Route::post('update/{id}', 'FoodController@update')->name('update');
            Route::get('list', 'FoodController@list')->name('list');
            Route::delete('delete/{id}', 'FoodController@delete')->name('delete');
            Route::get('status/{id}/{status}', 'FoodController@status')->name('status');
            Route::get('review-status/{id}/{status}', 'FoodController@reviews_status')->name('reviews.status');
            // Route::post('search', 'FoodController@search')->name('search');
            Route::post('search-restaurant', 'FoodController@search_vendor')->name('search-restaurant');
            Route::get('reviews', 'FoodController@review_list')->name('reviews');
            Route::post('restaurant-food-export', 'FoodController@restaurant_food_export')->name('restaurant-food-export');
            Route::get('restaurant-food-export/{type}/{restaurant_id}', 'FoodController@restaurant_food_export')->name('restaurant-food-export');

            Route::get('view/{id}', 'FoodController@view')->name('view');
            //ajax request
            Route::get('get-categories', 'FoodController@get_categories')->name('get-categories');
            Route::get('get-foods', 'FoodController@get_foods')->name('getfoods');

            Route::get('export', 'FoodController@export')->name('export');
            Route::get('reviews-export', 'FoodController@reviews_export')->name('reviews_export');
            Route::get('food-wise-reviews-export', 'FoodController@food_wise_reviews_export')->name('food_wise_reviews_export');

            //Import and export
            Route::get('bulk-import', 'FoodController@bulk_import_index')->name('bulk-import');
            Route::post('bulk-import', 'FoodController@bulk_import_data');
            Route::get('bulk-export', 'FoodController@bulk_export_index')->name('bulk-export-index');
            Route::post('bulk-export', 'FoodController@bulk_export_data')->name('bulk-export');
        });

        Route::group(['prefix' => 'banner', 'as' => 'banner.', 'middleware' => ['module:banner']], function () {
            Route::get('add-new', 'BannerController@index')->name('add-new');
            Route::post('store', 'BannerController@store')->name('store');
            Route::get('edit/{banner}', 'BannerController@edit')->name('edit');
            Route::post('update/{banner}', 'BannerController@update')->name('update');
            Route::get('status/{id}/{status}', 'BannerController@status')->name('status');
            Route::delete('delete/{banner}', 'BannerController@delete')->name('delete');
            Route::post('search', 'BannerController@search')->name('search');
            Route::get('promotional-banner', 'BannerController@promotional_banner')->name('promotional_banner');
            Route::post('promotional-banner-update', 'BannerController@promotional_banner_update')->name('promotional_banner_update');
        });

        Route::group(['prefix' => 'campaign', 'as' => 'campaign.', 'middleware' => ['module:campaign']], function () {
            Route::get('{type}/add-new', 'CampaignController@index')->name('add-new');
            Route::post('store/basic', 'CampaignController@storeBasic')->name('store-basic');
            Route::post('store/item', 'CampaignController@storeItem')->name('store-item');
            Route::get('{type}/edit/{campaign}', 'CampaignController@edit')->name('edit');
            Route::get('{type}/view/{campaign}', 'CampaignController@view')->name('view');
            Route::post('basic/update/{campaign}', 'CampaignController@update')->name('update-basic');
            Route::post('item/update/{campaign}', 'CampaignController@updateItem')->name('update-item');
            Route::get('remove-restaurant/{campaign}/{restaurant}', 'CampaignController@remove_restaurant')->name('remove-restaurant');
            Route::post('add-restaurant/{campaign}', 'CampaignController@addrestaurant')->name('addrestaurant');
            Route::get('{type}/list', 'CampaignController@list')->name('list');
            Route::get('status/{type}/{id}/{status}', 'CampaignController@status')->name('status');
            Route::delete('delete/{campaign}', 'CampaignController@delete')->name('delete');
            Route::delete('item/delete/{campaign}', 'CampaignController@delete_item')->name('delete-item');
            // Route::post('basic-search', 'CampaignController@searchBasic')->name('searchBasic');
            // Route::post('item-search', 'CampaignController@searchItem')->name('searchItem');
            Route::get('restaurant-confirmation/{campaign}/{id}/{status}', 'CampaignController@restaurant_confirmation')->name('restaurant_confirmation');
            Route::get('basic-campaign-export', 'CampaignController@basic_campaign_export')->name('basic_campaign_export');
            Route::get('item-campaign-export', 'CampaignController@item_campaign_export')->name('item_campaign_export');
            Route::get('food-campaign-order-list-export', 'CampaignController@food_campaign_list_export')->name('food_campaign_list_export');
        });

        Route::group(['prefix' => 'coupon', 'as' => 'coupon.', 'middleware' => ['module:coupon']], function () {
            Route::get('add-new', 'CouponController@add_new')->name('add-new');
            Route::post('store', 'CouponController@store')->name('store');
            Route::get('update/{id}', 'CouponController@edit')->name('update');
            Route::post('update/{id}', 'CouponController@update');
            Route::get('status/{id}/{status}', 'CouponController@status')->name('status');
            Route::delete('delete/{id}', 'CouponController@delete')->name('delete');
            // Route::post('search', 'CouponController@search')->name('search');
            Route::get('coupon-export', 'CouponController@coupon_export')->name('coupon_export');

        });

        Route::group(['prefix' => 'attribute', 'as' => 'attribute.', 'middleware' => ['module:attribute']], function () {
            Route::get('add-new', 'AttributeController@index')->name('add-new');
            Route::post('store', 'AttributeController@store')->name('store');
            Route::get('edit/{id}', 'AttributeController@edit')->name('edit');
            Route::post('update/{id}', 'AttributeController@update')->name('update');
            Route::delete('delete/{id}', 'AttributeController@delete')->name('delete');
            Route::post('search', 'AttributeController@search')->name('search');
            Route::get('export-attributes/{type}', 'AttributeController@export_attributes')->name('export-attributes');

            //Import and export
            Route::get('bulk-import', 'AttributeController@bulk_import_index')->name('bulk-import');
            Route::post('bulk-import', 'AttributeController@bulk_import_data');
            Route::get('bulk-export', 'AttributeController@bulk_export_index')->name('bulk-export-index');
            Route::post('bulk-export', 'AttributeController@bulk_export_data')->name('bulk-export');
        });

        Route::get('restaurant/get-restaurants', 'VendorController@get_restaurants')->name('restaurant.get-restaurants');
        Route::group(['prefix' => 'restaurant', 'as' => 'restaurant.','middleware'=>['module:restaurant']], function () {
            Route::get('get-restaurants-data/{restaurant}', 'VendorController@get_restaurant_data')->name('get-restaurants-data');
            Route::get('restaurant-filter/{id}', 'VendorController@restaurant_filter')->name('restaurantfilter');
            Route::get('get-account-data/{restaurant}', 'VendorController@get_account_data')->name('restaurantfilter');
            Route::get('get-addons', 'VendorController@get_addons')->name('get_addons');
            Route::group(['middleware' => ['module:restaurant']], function () {
                Route::get('update-application/{id}/{status}', 'VendorController@update_application')->name('application');
                Route::get('add', 'VendorController@index')->name('add');
                Route::post('store', 'VendorController@store')->name('store');
                Route::get('edit/{id}', 'VendorController@edit')->name('edit');
                Route::post('update/{restaurant}', 'VendorController@update')->name('update');
                Route::post('discount/{restaurant}', 'VendorController@discountSetup')->name('discount');
                Route::post('update-settings/{restaurant}', 'VendorController@updateRestaurantSettings')->name('update-settings');
                // Route::delete('delete/{restaurant}', 'VendorController@destroy')->name('delete');
                Route::delete('clear-discount/{restaurant}', 'VendorController@cleardiscount')->name('clear-discount');
                // Route::get('view/{restaurant}', 'VendorController@view')->name('view_tab');
                Route::get('view/{restaurant}/{tab?}/{sub_tab?}', 'VendorController@view')->name('view');
                Route::get('pending/list', 'VendorController@pending')->name('pending');
                Route::get('denied/list', 'VendorController@denied')->name('denied');
                // restaurant Transcation Search
                // Route::post('transcation/search/', 'VendorController@rest_transcation_search')->name('rest_transcation_search');
                // Route::post('transcation/search-by-date', 'VendorController@trans_search_by_date')->name('trans_search_by_date');

                // message
                Route::get('message/{conversation_id}/{user_id}', 'VendorController@conversation_view')->name('message-view');
                Route::get('message/list', 'VendorController@conversation_list')->name('message-list');

                Route::get('list', 'VendorController@list')->name('list');
                Route::post('search', 'VendorController@search')->name('search');
                Route::get('status/{restaurant}/{status}', 'VendorController@status')->name('status');
                Route::get('toggle-settings-status/{restaurant}/{status}/{menu}', 'VendorController@restaurant_status')->name('toggle-settings');
                Route::post('status-filter', 'VendorController@status_filter')->name('status-filter');
                //Import and export
                Route::get('bulk-import', 'VendorController@bulk_import_index')->name('bulk-import');
                Route::post('bulk-import', 'VendorController@bulk_import_data');
                Route::get('bulk-export', 'VendorController@bulk_export_index')->name('bulk-export-index');
                Route::post('bulk-export', 'VendorController@bulk_export_data')->name('bulk-export');
                Route::get('cash-transaction-export', 'VendorController@cash_transaction_export')->name('cash-transaction-export');
                Route::get('digital-transaction-export', 'VendorController@digital_transaction_export')->name('digital-transaction-export');
                Route::get('withdraw-transaction-export', 'VendorController@withdraw_transaction_export')->name('withdraw-transaction-export');
                //get all restaurants export
                Route::get('restaurants-export/{type}', 'VendorController@restaurants_export')->name('restaurants-export');
                //Restaurant shcedule
                Route::post('add-schedule', 'VendorController@add_schedule')->name('add-schedule');
                Route::get('remove-schedule/{restaurant_schedule}', 'VendorController@remove_schedule')->name('remove-schedule');

                Route::post('update-meta-data/{restaurant}', 'VendorController@updateStoreMetaData')->name('update-meta-data');
                Route::post('qrcode/store/{restaurant}', 'VendorController@qr_store')->name('qrcode.store');
                Route::get('qrcode/download-pdf/{restaurant}', 'VendorController@download_pdf')->name('qrcode.download-pdf');
                Route::get('qrcode/print/{restaurant}', 'VendorController@print_qrcode')->name('qrcode.print');

            });

            Route::group(['middleware' => ['module:withdraw_list']], function () {
                Route::post('withdraw-status/{id}', 'VendorController@withdrawStatus')->name('withdraw_status');
                Route::get('withdraw_list', 'VendorController@withdraw')->name('withdraw_list');
                Route::post('withdraw_list/search', 'VendorController@withdraw_search')->name('withdraw_list_search');
                Route::get('withdraw-view/{withdraw_id}/{seller_id}', 'VendorController@withdraw_view')->name('withdraw_view');
                Route::get('withdraw-list-export', 'VendorController@withdraw_list_export')->name('withdraw-list-export');
            });
                Route::get('disbursement-export/{id}/{type}', 'VendorController@disbursement_export')->name('disbursement-export');

            Route::get('restaurant-wise-reviwe-export', 'VendorController@restaurant_wise_reviwe_export')->name('restaurant_wise_reviwe_export');




        });

        Route::get('addon/system-addons', function (){
            return to_route('admin.system-addon.index');
        })->name('addon.index');

        Route::group(['prefix' => 'addon', 'as' => 'addon.', 'middleware' => ['module:addon']], function () {
            Route::get('add-new', 'AddOnController@index')->name('add-new');
            Route::post('store', 'AddOnController@store')->name('store');
            Route::get('edit/{id}', 'AddOnController@edit')->name('edit');
            Route::post('update/{id}', 'AddOnController@update')->name('update');
            Route::delete('delete/{id}', 'AddOnController@delete')->name('delete');
            Route::get('status/{addon}/{status}', 'AddOnController@status')->name('status');
            // Route::post('search', 'AddOnController@search')->name('search');
            //Import and export
            Route::get('export-addons', 'AddOnController@export_addons')->name('export_addons');
            Route::get('bulk-import', 'AddOnController@bulk_import_index')->name('bulk-import');
            Route::post('bulk-import', 'AddOnController@bulk_import_data');
            Route::get('bulk-export', 'AddOnController@bulk_export_index')->name('bulk-export-index');
            Route::post('bulk-export', 'AddOnController@bulk_export_data')->name('bulk-export');
        });

        Route::group(['prefix' => 'category', 'as' => 'category.'], function () {
            Route::get('get-all', 'CategoryController@get_all')->name('get-all');
            Route::group(['middleware' => ['module:category']], function () {
                Route::get('add', 'CategoryController@index')->name('add');
                Route::get('add-sub-category', 'CategoryController@sub_index')->name('add-sub-category');
                Route::get('add-sub-sub-category', 'CategoryController@sub_sub_index')->name('add-sub-sub-category');
                Route::post('store', 'CategoryController@store')->name('store');
                Route::get('edit/{id}', 'CategoryController@edit')->name('edit');
                Route::post('update/{id}', 'CategoryController@update')->name('update');
                Route::get('update-priority/{category}', 'CategoryController@update_priority')->name('priority');
                Route::post('store', 'CategoryController@store')->name('store');
                Route::get('status/{id}/{status}', 'CategoryController@status')->name('status');
                Route::delete('delete/{id}', 'CategoryController@delete')->name('delete');
                // Route::post('search', 'CategoryController@search')->name('search');
                Route::get('export-categories', 'CategoryController@export_categories')->name('export-categories');

                //Import and export
                Route::get('bulk-import', 'CategoryController@bulk_import_index')->name('bulk-import');
                Route::post('bulk-import', 'CategoryController@bulk_import_data');
                Route::get('bulk-export', 'CategoryController@bulk_export_index')->name('bulk-export-index');
                Route::post('bulk-export', 'CategoryController@bulk_export_data')->name('bulk-export');
            });
        });

        Route::group(['prefix' => 'cuisine', 'as' => 'cuisine.'], function () {
            Route::group(['middleware' => ['module:category']], function () {
                Route::get('add', 'CuisineController@index')->name('add');
                Route::get('status/{id}/{status}', 'CuisineController@status')->name('status');
                Route::put('update', 'CuisineController@update')->name('update');
                Route::post('store', 'CuisineController@store')->name('store');
                Route::delete('delete', 'CuisineController@destroy')->name('delete');
                Route::get('export', 'CuisineController@export')->name('export');
            });
        });

        Route::group(['prefix' => 'order', 'as' => 'order.', 'middleware' => ['module:order']], function () {
            Route::get('list/{status}', 'OrderController@list')->name('list');
            Route::get('details/{id}', 'OrderController@details')->name('details');
            Route::get('status', 'OrderController@status')->name('status');
            // Route::put('status-update/{id}', 'OrderController@status')->name('status-update');
            Route::get('view/{id}', 'OrderController@view')->name('view');
            Route::post('update-shipping/{order}', 'OrderController@update_shipping')->name('update-shipping');
            Route::delete('delete/{id}', 'OrderController@delete')->name('delete');
            //Route::post('orders-export', 'OrderController@orders_export')->name('export-orders');
            Route::get('orders-export/{type}/{restaurant_id}', 'OrderController@orders_export')->name('export-orders');

            Route::get('add-delivery-man/{order_id}/{delivery_man_id}', 'OrderController@add_delivery_man')->name('add-delivery-man');
            Route::get('payment-status', 'OrderController@payment_status')->name('payment-status');
            Route::get('generate-invoice/{id}', 'OrderController@generate_invoice')->name('generate-invoice');
            Route::post('add-payment-ref-code/{id}', 'OrderController@add_payment_ref_code')->name('add-payment-ref-code');
            Route::get('restaurant-filter/{restaurant_id}', 'OrderController@restaurnt_filter')->name('restaurant-filter');
            Route::get('filter/reset', 'OrderController@filter_reset');
            Route::post('filter', 'OrderController@filter')->name('filter');
            Route::post('search', 'OrderController@search')->name('search');
            Route::post('restaurant-order-search', 'OrderController@restaurant_order_search')->name('restaurant-order-search');
            //order update
            Route::post('add-to-cart', 'OrderController@add_to_cart')->name('add-to-cart');
            Route::post('remove-from-cart', 'OrderController@remove_from_cart')->name('remove-from-cart');
            Route::get('update/{order}', 'OrderController@update')->name('update');
            Route::get('edit-order/{order}', 'OrderController@edit')->name('edit');
            Route::get('quick-view', 'OrderController@quick_view')->name('quick-view');
            Route::get('quick-view-cart-item', 'OrderController@quick_view_cart_item')->name('quick-view-cart-item');
            Route::get('export-orders/{status}/{type}', 'OrderController@export_orders')->name('export');
            Route::post('add-order-proof/{id}', 'OrderController@add_order_proof')->name('add-order-proof');
            Route::get('remove-proof-image', 'OrderController@remove_proof_image')->name('remove-proof-image');
            Route::get('offline-payment', 'OrderController@offline_payment')->name('offline_payment');
            Route::get('offline/payment/list/{status}', 'OrderController@offline_verification_list')->name('offline_verification_list');
        });


        Route::group(['prefix' => 'dispatch', 'as' => 'dispatch.', 'middleware' => ['module:order']], function () {
            Route::get('list/{status}', 'OrderController@dispatch_list')->name('list');
        });

        Route::group(['prefix' => 'zone', 'as' => 'zone.', 'middleware' => ['module:zone']], function () {
            Route::get('/', 'ZoneController@index')->name('home');
            Route::post('store', 'ZoneController@store')->name('store');
            Route::get('edit/{id}', 'ZoneController@edit')->name('edit');
            Route::post('update/{id}', 'ZoneController@update')->name('update');
            Route::get('settings/{id}', 'ZoneController@zone_settings')->name('settings');
            Route::post('zone-settings-update/{id}', 'ZoneController@zone_settings_update')->name('zone_settings_update');
            Route::delete('delete/{zone}', 'ZoneController@destroy')->name('delete');
            Route::get('status/{id}/{status}', 'ZoneController@status')->name('status');
            Route::post('search', 'ZoneController@search')->name('search');
            Route::get('zone-filter/{id}', 'ZoneController@zone_filter')->name('zonefilter');
            Route::get('get-all-zone-cordinates/{id?}', 'ZoneController@get_all_zone_cordinates')->name('zoneCoordinates');
            //Route::post('export-zone-cordinates', 'ZoneController@export_zones')->name('export-zones');
            Route::get('export-zone-cordinates/{type}', 'ZoneController@export_zones')->name('export-zones');
            Route::post('store-incentive/{zone_id}', 'ZoneController@store_incentive')->name('incentive.store');
            Route::delete('destroy-incentive/{id}', 'ZoneController@destroy_incentive')->name('incentive.destory');
        });

        Route::group(['prefix' => 'notification', 'as' => 'notification.', 'middleware' => ['module:notification']], function () {
            Route::get('add-new', 'NotificationController@index')->name('add-new');
            Route::post('store', 'NotificationController@store')->name('store');
            Route::get('edit/{id}', 'NotificationController@edit')->name('edit');
            Route::post('update/{id}', 'NotificationController@update')->name('update');
            Route::get('status/{id}/{status}', 'NotificationController@status')->name('status');
            Route::delete('delete/{id}', 'NotificationController@delete')->name('delete');
            Route::get('export', 'NotificationController@export')->name('export');
        });

        Route::group(['prefix' => 'business-settings', 'as' => 'business-settings.', 'middleware' => ['module:settings', 'actch']], function () {
            Route::post('update-landing-setup', 'BusinessSettingsController@landing_page_settings_update')->name('business-setup.update-landing-setup');
            Route::delete('delete-custom-landing-page', 'BusinessSettingsController@delete_custom_landing_page')->name('business-setup.delete-custom-landing-page');

            Route::get('business-setup/{tab?}', 'BusinessSettingsController@business_index')->name('business-setup');
            Route::post('update-dm', 'BusinessSettingsController@update_dm')->name('update-dm');
            Route::post('update-disbursement', 'BusinessSettingsController@update_disbursement')->name('update-disbursement');
            Route::post('update-order', 'BusinessSettingsController@update_order')->name('update-order');
            Route::post('update-restaurant', 'BusinessSettingsController@update_restaurant')->name('update-restaurant');
            Route::get('config-setup', 'BusinessSettingsController@config_setup')->name('config-setup');
            Route::post('config-update', 'BusinessSettingsController@config_update')->name('config-update');
            Route::get('react-setup', 'BusinessSettingsController@react_setup')->name('react-setup');
            Route::post('react-update', 'BusinessSettingsController@react_update')->name('react-update');
            Route::post('update-setup', 'BusinessSettingsController@business_setup')->name('update-setup');
            Route::get('theme-settings', 'BusinessSettingsController@theme_settings')->name('theme-settings');
            Route::POST('theme-settings-update', 'BusinessSettingsController@update_theme_settings')->name('theme-settings-update');
            Route::get('app-settings', 'BusinessSettingsController@app_settings')->name('app-settings');
            Route::POST('app-settings', 'BusinessSettingsController@update_app_settings')->name('app-settings');
            Route::get('landing-page-settings/{tab?}', 'BusinessSettingsController@landing_page_settings')->name('landing-page-settings');
            Route::POST('landing-page-settings/{tab}', 'BusinessSettingsController@update_landing_page_settings')->name('landing-page-settings');
            Route::DELETE('landing-page-settings/{tab}/{key}', 'BusinessSettingsController@delete_landing_page_settings')->name('landing-page-settings-delete');

            Route::get('toggle-settings/{key}/{value}', 'BusinessSettingsController@toggle_settings')->name('toggle-settings');

            Route::get('fcm-index', 'BusinessSettingsController@fcm_index')->name('fcm-index');
            Route::post('update-fcm', 'BusinessSettingsController@update_fcm')->name('update-fcm');
            Route::get('fcm-config', 'BusinessSettingsController@fcm_config')->name('fcm-config');

            Route::post('update-fcm-messages', 'BusinessSettingsController@update_fcm_messages')->name('update-fcm-messages');

            Route::get('mail-config', 'BusinessSettingsController@mail_index')->name('mail-config');
            Route::post('mail-config', 'BusinessSettingsController@mail_config');
            Route::post('mail-config-status', 'BusinessSettingsController@mail_config_status')->name('mail-config-status');
            Route::get('send-mail', 'BusinessSettingsController@send_mail')->name('mail.send');

            Route::get('payment-method', 'BusinessSettingsController@payment_index')->name('payment-method');

            Route::post('payment-method-update', 'BusinessSettingsController@payment_config_update')->name('payment-method-update');

            Route::get('currency-add', 'BusinessSettingsController@currency_index')->name('currency-add');
            Route::post('currency-add', 'BusinessSettingsController@currency_store');
            Route::get('currency-update/{id}', 'BusinessSettingsController@currency_edit')->name('currency-update');
            Route::put('currency-update/{id}', 'BusinessSettingsController@currency_update');
            Route::delete('currency-delete/{id}', 'BusinessSettingsController@currency_delete')->name('currency-delete');

            Route::get('pages/terms-and-conditions', 'BusinessSettingsController@terms_and_conditions')->name('terms-and-conditions');
            Route::post('pages/terms-and-conditions', 'BusinessSettingsController@terms_and_conditions_update');

            Route::get('pages/privacy-policy', 'BusinessSettingsController@privacy_policy')->name('privacy-policy');
            Route::post('pages/privacy-policy', 'BusinessSettingsController@privacy_policy_update');

            Route::get('pages/refund-policy', 'BusinessSettingsController@refund_policy')->name('refund-policy');
            Route::post('pages/refund-policy', 'BusinessSettingsController@refund_policy_update');
            Route::get('pages/refund-policy/{status}', 'BusinessSettingsController@refund_policy_status')->name('refund-policy-status');

            Route::get('pages/shipping-policy', 'BusinessSettingsController@shipping_policy')->name('shipping-policy');
            Route::post('pages/shipping-policy', 'BusinessSettingsController@shipping_policy_update');
            Route::get('pages/shipping-policy/{status}', 'BusinessSettingsController@shipping_policy_status')->name('shipping-policy-status');

            Route::get('pages/cancellation-policy', 'BusinessSettingsController@cancellation_policy')->name('cancellation-policy');
            Route::post('pages/cancellation-policy', 'BusinessSettingsController@cancellation_policy_update');
            Route::get('pages/cancellation-policy/{status}', 'BusinessSettingsController@cancellation_policy_status')->name('cancellation-policy-status');

            Route::get('pages/about-us', 'BusinessSettingsController@about_us')->name('about-us');
            Route::post('pages/about-us', 'BusinessSettingsController@about_us_update');

            Route::get('sms-module', 'SMSModuleController@sms_index')->name('sms-module');
            Route::post('sms-module-update/{sms_module}', 'SMSModuleController@sms_update')->name('sms-module-update');

            //recaptcha
            Route::get('recaptcha', 'BusinessSettingsController@recaptcha_index')->name('recaptcha_index');
            Route::post('recaptcha-update', 'BusinessSettingsController@recaptcha_update')->name('recaptcha_update');
            Route::get('social-media/fetch', 'SocialMediaController@fetch')->name('social-media.fetch');
            Route::get('social-media/status-update', 'SocialMediaController@social_media_status_update')->name('social-media.status-update');
            Route::resource('social-media', 'SocialMediaController');

            //db clean
            Route::get('db-index', 'DatabaseSettingController@db_index')->name('db-index');
            Route::post('db-clean', 'DatabaseSettingController@clean_db')->name('clean-db');

            Route::get('site_direction', 'BusinessSettingsController@site_direction')->name('site_direction');
            //environment setup
            // Route::get('environment-setup', 'EnvironmentSettingsController@environment_index')->name('environment-setup');
            // Route::post('update-environment', 'EnvironmentSettingsController@environment_setup')->name('update-environment');


            Route::group(['prefix' => 'withdraw-method', 'as' => 'withdraw-method.'], function () {
                Route::get('list', 'WithdrawalMethodController@list')->name('list');
                Route::get('create', 'WithdrawalMethodController@create')->name('create');
                Route::post('store', 'WithdrawalMethodController@store')->name('store');
                Route::get('edit/{id}', 'WithdrawalMethodController@edit')->name('edit');
                Route::put('update', 'WithdrawalMethodController@update')->name('update');
                Route::delete('delete/{id}', 'WithdrawalMethodController@delete')->name('delete');
                Route::post('status-update', 'WithdrawalMethodController@status_update')->name('status-update');
                Route::post('default-status-update', 'WithdrawalMethodController@default_status_update')->name('default-status-update');
            });

            Route::get('email-setup/{type}/{tab?}', 'BusinessSettingsController@email_index')->name('email-setup');
            Route::POST('email-setup/{type}/{tab?}', 'BusinessSettingsController@update_email_index')->name('email-setup');
            Route::get('email-status/{type}/{tab}/{status}', 'BusinessSettingsController@update_email_status')->name('email-status');
            // Offline payment Methods
            Route::get('/offline-payment', 'OfflinePaymentMethodController@index')->name('offline');
            Route::get('/offline-payment/new', 'OfflinePaymentMethodController@create')->name('offline.new');
            Route::post('/offline-payment/store', 'OfflinePaymentMethodController@store')->name('offline.store');
            Route::get('/offline-payment/edit/{id}', 'OfflinePaymentMethodController@edit')->name('offline.edit');
            Route::post('/offline-payment/update', 'OfflinePaymentMethodController@update')->name('offline.update');
            Route::post('/offline-payment/delete', 'OfflinePaymentMethodController@delete')->name('offline.delete');
            Route::get('/offline-payment/status/{id}', 'OfflinePaymentMethodController@status')->name('offline.status');

            Route::get('/restaurant/join-us/setup', 'PageSetupController@restaurant_page_setup')->name('restaurant_page_setup');
            Route::post('/restaurant/join-us/update', 'PageSetupController@restaurant_page_setup_update')->name('restaurant_page_setup_update');
            Route::get('/deliveryman/join-us/setup', 'PageSetupController@deliveryman_page_setup')->name('delivery_man_page_setup');
            Route::post('/delivery-man/join-us/update', 'PageSetupController@deliveryman_page_setup_update')->name('delivery_man_page_setup_update');

        });

        Route::group(['prefix' => 'landing-page', 'as' => 'landing_page.', 'middleware' => ['module:settings', 'actch']], function () {
            Route::post('landing-page-settings/{tab}', 'LandingPageController@update_admin_landing_page_settings')->name('settings');

            // testimonials
            Route::get('testimonials', 'LandingPageController@testimonial')->name('testimonial');
            Route::post('testimonial-store/', 'LandingPageController@testimonial_store')->name('testimonial_store');
            Route::get('testimonial-status/{id}/{status}', 'LandingPageController@testimonial_status')->name('testimonial_status');
            Route::get('testimonial/edit/{id}', 'LandingPageController@testimonial_edit')->name('testimonial_edit');
            Route::post('testimonial/update/{id}', 'LandingPageController@testimonial_update')->name('testimonial_update');
            Route::delete('testimonial/delete/{testimonial}', 'LandingPageController@testimonial_destroy')->name('testimonial_delete');
            // testimonials end
            // features
            Route::get('features', 'LandingPageController@features')->name('features');
            Route::post('feature-store/', 'LandingPageController@feature_store')->name('feature_store');
            Route::get('feature-status/{id}/{status}', 'LandingPageController@feature_status')->name('feature_status');
            Route::get('feature/edit/{id}', 'LandingPageController@feature_edit')->name('feature_edit');
            Route::post('feature/update/{id}', 'LandingPageController@feature_update')->name('feature_update');
            Route::delete('feature/delete/{feature}', 'LandingPageController@feature_destroy')->name('feature_delete');
            // features end
            // criteris

            // // Route::get('criteris', 'LandingPageController@criteris')->name('criteris');
            // Route::post('criteria-store/', 'LandingPageController@criteria_store')->name('criteria_store');
            // Route::get('criteria-status/{id}/{status}', 'LandingPageController@criteria_status')->name('criteria_status');
            // Route::get('criteria/edit/{id}', 'LandingPageController@criteria_edit')->name('criteria_edit');
            // Route::post('criteria/update/{id}', 'LandingPageController@criteria_update')->name('criteria_update');
            // Route::delete('criteria/delete/{criteria}', 'LandingPageController@criteria_destroy')->name('criteria_delete');
            // // criteris end


            Route::get('header', 'LandingPageController@header')->name('header');
            Route::get('about-us', 'LandingPageController@about_us')->name('about_us');
            Route::get('why-choose-us', 'LandingPageController@why_choose_us')->name('why_choose_us');
            Route::get('earn-money', 'LandingPageController@earn_money')->name('earn_money');
            Route::get('services', 'LandingPageController@services')->name('services');
            Route::get('fixed-data', 'LandingPageController@fixed_data')->name('fixed_data');
            Route::get('links', 'LandingPageController@links')->name('links');
            Route::get('backgroung-color', 'LandingPageController@backgroung_color')->name('backgroung_color');
        });
        Route::group(['prefix' => 'react-landing-page', 'as' => 'react_landing_page.', 'middleware' => ['module:settings', 'actch']], function () {
            Route::post('landing-page-settings/{tab}', 'LandingPageController@update_react_landing_page_settings')->name('settings');

            Route::get('header', 'LandingPageController@react_header')->name('react_header');
            Route::get('fixed-data', 'LandingPageController@react_fixed_data')->name('react_fixed_data');
            // services
            Route::get('services', 'LandingPageController@react_services')->name('react_services');
            Route::post('service-store/', 'LandingPageController@react_service_store')->name('service_store');
            Route::get('service-status/{id}/{status}', 'LandingPageController@react_service_status')->name('service_status');
            Route::get('service/edit/{id}', 'LandingPageController@react_service_edit')->name('service_edit');
            Route::post('service/update/{id}', 'LandingPageController@react_service_update')->name('service_update');
            Route::delete('service/delete/{service}', 'LandingPageController@react_service_destroy')->name('service_delete');
            Route::get('service-export', 'LandingPageController@service_export')->name('service_export');
            // services end
            // promotional_banner
            Route::get('promotional-banner', 'LandingPageController@react_promotional_banner')->name('promotional_banner');
            Route::post('promotional-banner-store/', 'LandingPageController@react_promotional_banner_store')->name('promotional_banner_store');
            Route::get('promotional-banner-status/{id}/{status}', 'LandingPageController@react_promotional_banner_status')->name('promotional_banner_status');
            Route::get('promotional-banner/edit/{id}', 'LandingPageController@react_promotional_banner_edit')->name('promotional_banner_edit');
            Route::post('promotional-banner/update/{id}', 'LandingPageController@react_promotional_banner_update')->name('promotional_banner_update');
            Route::delete('promotional-banner/delete/{react_promotional_banner}', 'LandingPageController@react_promotional_banner_destroy')->name('promotional_banner_delete');
            Route::get('promotional-banner-export', 'LandingPageController@react_promotional_banners_export')->name('react_promotional_banners_export');
            // promotional_banner end

            Route::get('registration-scetion', 'LandingPageController@registration_scetion')->name('registration_scetion');
            Route::get('download-apps', 'LandingPageController@download_apps')->name('download_apps');
        });

        Route::group(['prefix' => 'message', 'as' => 'message.'], function () {
            Route::get('list', 'ConversationController@list')->name('list');
            Route::post('store/{user_id}', 'ConversationController@store')->name('store');
            Route::get('view/{conversation_id}/{user_id}', 'ConversationController@view')->name('view');
        });

        Route::group(['prefix' => 'delivery-man', 'as' => 'delivery-man.'], function () {
            Route::get('get-deliverymen', 'DeliveryManController@get_deliverymen')->name('get-deliverymen');
            Route::get('get-account-data/{deliveryman}', 'DeliveryManController@get_account_data')->name('restaurantfilter');
            Route::group(['middleware' => ['module:deliveryman']], function () {
                Route::get('add', 'DeliveryManController@index')->name('add');
                Route::post('store', 'DeliveryManController@store')->name('store');
                Route::get('list', 'DeliveryManController@list')->name('list');
                Route::get('preview/{id}/{tab?}', 'DeliveryManController@preview')->name('preview');
                Route::get('status/{id}/{status}', 'DeliveryManController@status')->name('status');
                Route::get('earning/{id}/{status}', 'DeliveryManController@earning')->name('earning');
                Route::get('update-application/{id}/{status}', 'DeliveryManController@update_application')->name('application');
                Route::get('edit/{id}', 'DeliveryManController@edit')->name('edit');
                Route::post('update/{id}', 'DeliveryManController@update')->name('update');
                Route::delete('delete/{id}', 'DeliveryManController@delete')->name('delete');
                // Route::post('search', 'DeliveryManController@search')->name('search');
                Route::get('export-delivery-man', 'DeliveryManController@dm_list_export')->name('export-delivery-man');
                Route::get('pending/list', 'DeliveryManController@pending')->name('pending');
                Route::get('denied/list', 'DeliveryManController@denied')->name('denied');
                Route::get('earning-export', 'DeliveryManController@earning_export')->name('earning-export');
                Route::get('review-export', 'DeliveryManController@review_export')->name('review-export');
                Route::get('disbursement-export/{id}/{type}', 'DeliveryManController@disbursement_export')->name('disbursement-export');
                Route::get('pending-delivery-man-view/{id}', 'DeliveryManController@pending_dm_view')->name('pending_dm_view');

                Route::group(['prefix' => 'reviews', 'as' => 'reviews.'], function () {
                    Route::get('list', 'DeliveryManController@reviews_list')->name('list');
                    Route::get('status/{id}/{status}', 'DeliveryManController@reviews_status')->name('status');
                    Route::get('export', 'DeliveryManController@reviews_export')->name('export');

                });

                //incentive
                Route::get('incentive', 'DeliveryManController@pending_incentives')->name('incentive');
                Route::get('incentive-history', 'DeliveryManController@get_incentives')->name('incentive-history');
                Route::put('incentive', 'DeliveryManController@update_incentive_status');
                Route::post('incentive_all', 'DeliveryManController@update_all_incentive_status')->name('update-incentive');
                 //bonus
                Route::get('bonus', 'DeliveryManController@get_bonus')->name('bonus');
                Route::post('bonus', 'DeliveryManController@add_bonus');
                // message
                Route::get('message/{conversation_id}/{user_id}', 'DeliveryManController@conversation_view')->name('message-view');
                Route::get('{user_id}/message/list', 'DeliveryManController@conversation_list')->name('message-list');
                Route::get('messages/details', 'DeliveryManController@get_conversation_list')->name('message-list-search');
            });
        });

        //Pos system
        Route::group(['prefix' => 'pos', 'as' => 'pos.'], function () {
            Route::post('variant_price', 'POSController@variant_price')->name('variant_price');
            Route::group(['middleware' => ['module:pos']], function () {
                Route::get('/', 'POSController@index')->name('index');
                Route::get('quick-view', 'POSController@quick_view')->name('quick-view');
                Route::get('quick-view-cart-item', 'POSController@quick_view_card_item')->name('quick-view-cart-item');
                Route::post('add-to-cart', 'POSController@addToCart')->name('add-to-cart');
                Route::post('add-delivery-address', 'POSController@addDeliveryInfo')->name('add-delivery-address');
                Route::post('remove-from-cart', 'POSController@removeFromCart')->name('remove-from-cart');
                Route::post('cart-items', 'POSController@cart_items')->name('cart_items');
                Route::post('update-quantity', 'POSController@updateQuantity')->name('updateQuantity');
                Route::post('empty-cart', 'POSController@emptyCart')->name('emptyCart');
                Route::post('tax', 'POSController@update_tax')->name('tax');
                Route::post('paid', 'POSController@update_paid')->name('paid');
                Route::post('discount', 'POSController@update_discount')->name('discount');
                Route::get('customers', 'POSController@get_customers')->name('customers');
                Route::get('select-customer', 'POSController@select_customer')->name('select-customer');
                Route::post('place-order', 'POSController@place_order')->name('order');
                Route::get('orders', 'POSController@order_list')->name('orders');
                Route::post('search', 'POSController@search')->name('search');
                Route::get('order-details/{id}', 'POSController@order_details')->name('order-details');
                Route::get('invoice/{id}', 'POSController@generate_invoice');
                Route::post('customer-store', 'POSController@customer_store')->name('customer-store');
                Route::get('data', 'POSController@extra_charge')->name('extra_charge');
            });
        });
        Route::group(['prefix' => 'reviews', 'as' => 'reviews.', 'middleware' => ['module:customerList']], function () {
            Route::get('list', 'ReviewsController@list')->name('list');
            Route::post('search', 'ReviewsController@search')->name('search');
        });

        Route::group(['prefix' => 'report', 'as' => 'report.', 'middleware' => ['module:report']], function () {
            Route::get('order', 'ReportController@order_index')->name('order');
            Route::get('transaction-report', 'ReportController@day_wise_report')->name('day-wise-report');
            Route::get('food-wise-report', 'ReportController@food_wise_report')->name('food-wise-report');
            Route::get('food-wise-report-export', 'ReportController@food_wise_report_export')->name('food-wise-report-export');
            Route::get('transaction-report-export', 'ReportController@day_wise_report_export')->name('day-wise-report-export');
            Route::get('order-transactions', 'ReportController@order_transaction')->name('order-transaction');
            Route::get('earning', 'ReportController@earning_index')->name('earning');
            Route::post('set-date', 'ReportController@set_date')->name('set-date');
            Route::get('expense-report', 'ReportController@expense_report')->name('expense-report');
            Route::get('expense-export', 'ReportController@expense_export')->name('expense-export');
            Route::post('expense-report-search', 'ReportController@expense_search')->name('expense-report-search');

            Route::get('subscription-report', 'ReportController@subscription_report')->name('subscription-report');
            Route::get('subscription-export', 'ReportController@subscription_export')->name('subscription-export');

            Route::get('restaurant-report', 'ReportController@restaurant_report')->name('restaurant-report');
            Route::get('restaurant-export', 'ReportController@restaurant_export')->name('restaurant-wise-report-export');

            Route::get('generate-statement/{id}', 'ReportController@generate_statement')->name('generate-statement');
            Route::get('subscription/generate-statement/{id}', 'ReportController@subscription_generate_statement')->name('subscription.generate-statement');

            Route::get('order-report', 'ReportController@order_report')->name('order-report');
            Route::post('order-report-search', 'ReportController@search_order_report')->name('search_order_report');
            Route::get('order-report-export', 'ReportController@order_report_export')->name('order-report-export');

            Route::get('campaign-order-report', 'ReportController@campaign_order_report')->name('campaign_order-report');
            Route::get('campaign-order-report-export', 'ReportController@campaign_report_export')->name('campaign_report_export');

            Route::get('disbursement-report/{tab?}', 'ReportController@disbursement_report')->name('disbursement_report');
            Route::get('disbursement-report-export/{type}/{tab?}', 'ReportController@disbursement_report_export')->name('disbursement_report_export');
        });
        Route::get('customer/wallet/report', 'CustomerWalletController@report')->name('customer.wallet.report')->middleware('module:report');
        Route::get('customer/wallet/export', 'CustomerWalletController@export')->name('customer.wallet.export')->middleware('module:report');




        Route::get('customer/select-list', 'CustomerController@get_customers')->name('customer.select-list');
        Route::group(['prefix' => 'customer', 'as' => 'customer.', 'middleware' => ['module:customerList']], function () {
            Route::get('list', 'CustomerController@customer_list')->name('list');
            Route::get('view/{user_id}', 'CustomerController@view')->name('view');
            Route::post('search', 'CustomerController@search')->name('search');
            Route::post('order-search', 'CustomerController@order_search')->name('order_search');
            Route::get('status/{customer}/{status}', 'CustomerController@status')->name('status');
            Route::get('logs', 'VisitorLogController@index')->name('visitor_logs');

            Route::group(['prefix' => 'wallet', 'as' => 'wallet.', 'middleware' => ['module:customer_wallet']], function () {
                Route::get('add-fund', 'CustomerWalletController@add_fund_view')->name('add-fund');
                Route::post('add-fund', 'CustomerWalletController@add_fund');
                Route::group(['prefix' => 'bonus', 'as' => 'bonus.'], function () {
                    Route::get('add-new', 'WalletBonusController@add_new')->name('add-new');
                    Route::post('store', 'WalletBonusController@store')->name('store');
                    Route::get('update/{id}', 'WalletBonusController@edit')->name('update');
                    Route::post('update/{id}', 'WalletBonusController@update');
                    Route::get('status/{id}/{status}', 'WalletBonusController@status')->name('status');
                    Route::delete('delete/{id}', 'WalletBonusController@delete')->name('delete');
                    Route::post('search', 'WalletBonusController@search')->name('search');
                });
            });

            // Subscribed customer Routes
            Route::get('subscribed', 'CustomerController@subscribedCustomers')->name('subscribed');
            Route::get('subscriber-export', 'CustomerController@subscribed_customer_export')->name('subscriber-export');
            // Route::post('subscriber-search', 'CustomerController@subscriberMailSearch')->name('subscriberMailSearch');

            Route::get('loyalty-point/report', 'LoyaltyPointController@report')->name('loyalty-point.report');
            Route::get('loyalty-point/export', 'LoyaltyPointController@export')->name('loyalty-point.export');
            Route::get('settings', 'CustomerController@settings')->name('settings');
            Route::post('update-settings', 'CustomerController@update_settings')->name('update-settings');

            Route::get('export', 'CustomerController@export')->name('export');
            Route::get('order-export', 'CustomerController@customer_order_export')->name('order-export');

        });



        Route::group(['prefix' => 'file-manager', 'as' => 'file-manager.'], function () {
            Route::get('/download/{file_name}', 'FileManagerController@download')->name('download');
            Route::get('/index/{folder_path?}', 'FileManagerController@index')->name('index');
            Route::post('/image-upload', 'FileManagerController@upload')->name('image-upload');
            Route::delete('/delete/{file_path}', 'FileManagerController@destroy')->name('destroy');
        });

        Route::group(['prefix' => 'subscription', 'as' => 'subscription.','middleware'=>['module:restaurant', 'module:business_settings']], function () {
            Route::get('/', 'SubscriptionController@package_list')->name('list');

            Route::get('package/add', 'SubscriptionController@create')->name('create');
            Route::post('store/', 'SubscriptionController@store')->name('subscription_store');
            Route::get('package/export', 'SubscriptionController@package_list_export')->name('package_list_export');
            Route::get('package/details/{id}', 'SubscriptionController@details')->name('package_details');
            // Route::post('package/search', 'SubscriptionController@search')->name('package_search');
            Route::get('status/{package}/{status}', 'SubscriptionController@status')->name('package_status');
            Route::get('package/{id}/edit', 'SubscriptionController@edit')->name('package_edit');
            Route::get('package/list/', 'SubscriptionController@package_list')->name('package_list');
            Route::get('settings/', 'SubscriptionController@settings')->name('settings');
            Route::post('settings/update/', 'SubscriptionController@settings_update')->name('settings_update');
            Route::get('settings/update/{status}', 'SubscriptionController@settings_update_status')->name('settings_update_status');

            Route::get('package_selected/{id}/{rest_id}', 'SubscriptionController@package_selected')->name('package_selected');

            Route::post('update/', 'SubscriptionController@update')->name('subscription_update');
            Route::get('transcation/list/{id}', 'SubscriptionController@transcation_list')->name('transcation_list');
            Route::get('transcation-list/export', 'SubscriptionController@transcation_list_export')->name('transcation_list_export');
            // Route::post('transcation/search', 'SubscriptionController@transcation_search')->name('transcation_search');
            // Route::post('/search', 'SubscriptionController@trans_search_by_date')->name('trans_search_by_date');

            Route::post('subscription/search', 'SubscriptionController@subscription_search')->name('subscription_search');

            Route::delete('package/cancel', 'SubscriptionController@package_cancel')->name('package_cancel');

            // Route::post('new_max_order/', 'SubscriptionController@new_max_order')->name('new_max_order');
            // Route::get('subscription_delete/{key}/{value}', 'SubscriptionController@subscription_delete')->name('subscription_delete');
            Route::get('list/', 'SubscriptionController@subscription_list')->name('subscription_list');
            Route::get('invoice/{id}', 'SubscriptionController@invoice')->name('invoice');


            Route::get('subscription/package/{id}', 'SubscriptionController@package_renew_change')->name('package_renew_change');
            Route::post('package_renew_change_update', 'SubscriptionController@package_renew_change_update')->name('package_renew_change_update');
        });

        //social media login
        Route::group(['prefix' => 'social-login', 'as' => 'social-login.','middleware'=>['module:business_settings']], function () {
            Route::get('view', 'BusinessSettingsController@viewSocialLogin')->name('view');
            Route::post('update/{service}', 'BusinessSettingsController@updateSocialLogin')->name('update');
        });
        Route::group(['prefix' => 'apple-login', 'as' => 'apple-login.'], function () {
            Route::post('update/{service}', 'BusinessSettingsController@updateAppleLogin')->name('update');
        });

        Route::group(['prefix' => 'contact', 'as' => 'contact.','middleware'=>['module:contact_message']], function () {
            // Route::post('contact-store', 'ContactMessages@store')->name('store');
            Route::get('list', 'ContactMessages@list')->name('list');
            Route::delete('delete', 'ContactMessages@destroy')->name('delete');
            Route::get('view/{id}', 'ContactMessages@view')->name('view');
            Route::post('update/{id}', 'ContactMessages@update')->name('update');
            Route::post('send-mail/{id}', 'ContactMessages@send_mail')->name('send-mail');
        });
        // ,'middleware'=>['module:vehicle']
        Route::group(['prefix' => 'vehicle', 'as' => 'vehicle.', 'middleware' => ['module:deliveryman']], function () {
            // Route::post('contact-store', 'ContactMessages@store')->name('store');
            Route::get('list', 'VehicleController@list')->name('list');
            Route::get('add', 'VehicleController@create')->name('create');
            Route::get('status/{vehicle}/{status}', 'VehicleController@status')->name('status');
            Route::get('edit/{vehicle}', 'VehicleController@edit')->name('edit');
            Route::post('store', 'VehicleController@store')->name('store');
            Route::post('update/{vehicle}', 'VehicleController@update')->name('update');
            Route::delete('delete', 'VehicleController@destroy')->name('delete');
            Route::get('view/{vehicle}', 'VehicleController@view')->name('view');

        });
        Route::group(['middleware' => ['module:order']], function () {
            Route::get('order-cancel-reasons/status/{id}/{status}', 'OrderCancelReasonController@status')->name('order-cancel-reasons.status');
            Route::get('order-cancel-reasons', 'OrderCancelReasonController@index')->name('order-cancel-reasons.index');
            Route::post('order-cancel-reasons/store', 'OrderCancelReasonController@store')->name('order-cancel-reasons.store');
            Route::put('order-cancel-reasons/update', 'OrderCancelReasonController@update')->name('order-cancel-reasons.update');
            Route::delete('order-cancel-reasons/{destroy}', 'OrderCancelReasonController@destroy')->name('order-cancel-reasons.destroy');

            Route::group(['prefix' => 'order', 'as' => 'order.subscription.'], function () {
                Route::get('subscription/update-status/{supscription_id}/{status}', 'OrderSubscriptionController@view')->name('update-status');
                Route::get('subscription', 'OrderSubscriptionController@index')->name('index');
                Route::get('subscription/show/{subscription}', 'OrderSubscriptionController@show')->name('show');
                Route::get('subscription/edit/{subscription}', 'OrderSubscriptionController@edit')->name('edit');
                Route::put('subscription/update/{subscription}', 'OrderSubscriptionController@update')->name('update');
                Route::delete('subscription/pause_log_delete/{subscription}', 'OrderSubscriptionController@pause_log_delete')->name('pause_log_delete');
            });
        });
        Route::group(['prefix' => 'shift', 'as' => 'shift.'], function () {
            Route::get('/', 'ShiftController@list')->name('list');
            Route::post('store', 'ShiftController@store')->name('store');
            Route::get('edit/{id}', 'ShiftController@edit')->name('edit');
            Route::post('update', 'ShiftController@update')->name('update');
            Route::delete('delete/{shift}', 'ShiftController@destroy')->name('delete');
            Route::get('status/{id}/{status}', 'ShiftController@status')->name('status');
        });


        Route::group(['prefix' => 'business-settings', 'as' => 'language.','middleware' => ['module:settings']], function () {
            Route::get('language', 'LanguageController@index')->name('index');
            Route::post('language/add-new', 'LanguageController@store')->name('add-new');
            Route::get('language/update-status', 'LanguageController@update_status')->name('update-status');
            Route::get('language/update-default-status', 'LanguageController@update_default_status')->name('update-default-status');
            Route::post('language/update', 'LanguageController@update')->name('update');
            Route::get('language/translate/{lang}', 'LanguageController@translate')->name('translate');
            Route::post('language/translate-submit/{lang}', 'LanguageController@translate_submit')->name('translate-submit');
            Route::post('language/remove-key/{lang}', 'LanguageController@translate_key_remove')->name('remove-key');
            Route::get('language/delete/{lang}', 'LanguageController@delete')->name('delete');
            Route::any('language/auto-translate/{lang}', 'LanguageController@auto_translate')->name('auto-translate');
        });

        Route::group(['prefix' => 'business-settings', 'as' => 'refund.', 'middleware' => ['module:order']], function () {
            Route::get('refund/settings', 'OrderController@refund_settings')->name('refund_settings');
            Route::get('refund_mode', 'OrderController@refund_mode')->name('refund_mode');
            Route::post('refund_reason', 'OrderController@refund_reason')->name('refund_reason');
            Route::get('refund/status/{id}/{status}', 'OrderController@reason_status')->name('reason_status');
            Route::put('refund/reason_edit/', 'OrderController@reason_edit')->name('reason_edit');
            Route::delete('refund/reason_delete/{id}', 'OrderController@reason_delete')->name('reason_delete');
            Route::put('refund/order_refund_rejection/','OrderController@order_refund_rejection')->name('order_refund_rejection');
        });

        Route::group(['prefix' => 'login-url', 'as' => 'login_url.', 'middleware' => ['module:settings']], function () {
            Route::get('login-page-setup', 'BusinessSettingsController@login_url_page')->name('login_url_page');
            Route::post('login-page-setup/update', 'BusinessSettingsController@login_url_page_update')->name('login_url_page_update');
        });

        Route::get('refund/{status}', 'OrderController@list')->name('refund.refund_attr')->middleware('module:order');
        Route::post('remove_image', 'BusinessSettingsController@remove_image')->name('remove_image');

        Route::group(['namespace' => 'System','prefix' => 'system-addon', 'as' => 'business-settings.system-addon.', 'middleware'=>['module:settings']], function () {
            Route::get('/', 'AddonController@index')->name('index');
            Route::post('publish', 'AddonController@publish')->name('publish');
            Route::post('activation', 'AddonController@activation')->name('activation');
            Route::post('upload', 'AddonController@upload')->name('upload');
            Route::post('delete', 'AddonController@delete_theme')->name('delete');
        });

        Route::group(['prefix' => 'restaurant-disbursement', 'as' => 'restaurant-disbursement.', 'middleware' => ['module:account']], function () {
            Route::get('list', 'RestaurantDisbursementController@list')->name('list');
            Route::get('details/{id}', 'RestaurantDisbursementController@view')->name('view');
            Route::get('status', 'RestaurantDisbursementController@status')->name('status');
            Route::get('change-status/{id}/{status}', 'RestaurantDisbursementController@statusById')->name('change-status');
            Route::get('export/{id}/{type?}', 'RestaurantDisbursementController@export')->name('export');
        });
        Route::group(['prefix' => 'dm-disbursement', 'as' => 'dm-disbursement.', 'middleware' => ['module:account']], function () {
            Route::get('list', 'DeliveryManDisbursementController@list')->name('list');
            Route::get('details/{id}', 'DeliveryManDisbursementController@view')->name('view');
            Route::get('export/{id}/{type?}', 'DeliveryManDisbursementController@export')->name('export');
            Route::get('status', 'DeliveryManDisbursementController@status')->name('status');
            Route::get('change-status/{id}/{status}', 'DeliveryManDisbursementController@statusById')->name('change-status');
            Route::get('export/{id}/{type?}', 'DeliveryManDisbursementController@export')->name('export');
        });
    }); //Admin auth middleware
    Route::get('zone/get-coordinates/{id}', 'ZoneController@get_coordinates')->name('zone.get-coordinates');
});

