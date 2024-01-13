
<?php
// COUNT(CASE WHEN order_status = "pending" AND ((created_at <> schedule_at AND ((schedule_at BETWEEN ? AND ?) OR schedule_at < ?))OR created_at = schedule_at) THEN 1 END) as pending,
// COUNT(CASE WHEN order_status NOT IN ("delivered", "failed","canceled","refund_requested","refund_request_canceled","refunded") AND delivery_man_id IS NULL AND order_type = "delivery" THEN 1 END) as searching_dm,
                $order = \App\Models\Order::Notpos()->HasSubscriptionToday()
                        ->selectRaw('COUNT(*) as total,
                        COUNT(CASE WHEN order_status = "delivered" THEN 1 END) as delivered,
                        COUNT(CASE WHEN order_status = "canceled" THEN 1 END) as canceled,
                        COUNT(CASE WHEN order_status = "failed" THEN 1 END) as failed,
                        COUNT(CASE WHEN order_status = "refunded" THEN 1 END) as refunded,
                        COUNT(CASE WHEN order_status = "refund_requested" THEN 1 END) as refund_requested,
                        COUNT(CASE WHEN order_status IN ("confirmed", "processing","handover") THEN 1 END) as processing,
                        COUNT(CASE WHEN created_at <> schedule_at AND scheduled = 1 THEN 1 END) as scheduled')
                        ->first();


                $order_sch = \App\Models\Order::Notpos()->HasSubscriptionToday()->OrderScheduledIn(30)
                        ->selectRaw('COUNT(CASE WHEN order_status = "pending" THEN 1 END) as pending,
                        COUNT(CASE WHEN order_status = "picked_up" THEN 1 END) as picked_up,
                        COUNT(CASE WHEN order_status IN ("accepted", "confirmed","processing","handover","picked_up") THEN 1 END) as ongoing,
                        COUNT(CASE WHEN delivery_man_id IS NULL  AND order_type = "delivery" AND order_status NOT IN ("delivered", "failed","canceled","refund_requested","refund_request_canceled","refunded") THEN 1 END) as searching_dm,
                        COUNT(CASE WHEN order_status = "accepted" THEN 1 END) as accepted')
                        ->first();
?>

<div id="sidebarMain" class="d-none">
    <aside
        class="js-navbar-vertical-aside navbar navbar-vertical-aside navbar-vertical navbar-vertical-fixed navbar-expand-xl navbar-bordered  ">
        <div class="navbar-vertical-container">
            <div class="navbar__brand-wrapper navbar-brand-wrapper justify-content-between">
                <!-- Logo -->
                <?php ($restaurant_logo = \App\Models\BusinessSetting::where(['key' => 'logo'])->first()->value); ?>
                <a class="navbar-brand d-block p-0" href="<?php echo e(route('admin.dashboard')); ?>" aria-label="Front">
                    <img class="navbar-brand-logo sidebar--logo-design"
                        onerror="this.src='<?php echo e(asset('public/assets/admin/img/160x160/img2.jpg')); ?>'"
                        src="<?php echo e(asset('storage/app/public/business/' . $restaurant_logo)); ?>" alt="Logo">
                    <img class="navbar-brand-logo-mini sidebar--logo-design-2"
                        onerror="this.src='<?php echo e(asset('public/assets/admin/img/160x160/img2.jpg')); ?>'"
                        src="<?php echo e(asset('storage/app/public/business/' . $restaurant_logo)); ?>" alt="Logo">
                </a>
                <!-- End Logo -->

                <!-- Navbar Vertical Toggle -->
                <button type="button"
                    class="js-navbar-vertical-aside-toggle-invoker navbar-vertical-aside-toggle btn btn-icon btn-xs btn-ghost-dark">
                    <i class="tio-clear tio-lg"></i>
                </button>
                <!-- End Navbar Vertical Toggle -->

                <div class="navbar-nav-wrap-content-left d-none d-xl-block">
                    <!-- Navbar Vertical Toggle -->
                    <button type="button" class="js-navbar-vertical-aside-toggle-invoker close">
                        <i class="tio-first-page navbar-vertical-aside-toggle-short-align" data-toggle="tooltip"
                            data-placement="right" title="Collapse"></i>
                        <i class="tio-last-page navbar-vertical-aside-toggle-full-align"
                            data-template='<div class="tooltip d-none" role="tooltip"><div class="arrow"></div><div class="tooltip-inner"></div></div>'
                            data-toggle="tooltip" data-placement="right" title="Expand"></i>
                    </button>
                    <!-- End Navbar Vertical Toggle -->
                </div>

            </div>

            <!-- Content -->
            <div class="navbar-vertical-content bg--title" id="navbar-vertical-content">
                <!-- Search Form -->
                <!-- <form class="sidebar--search-form">
                    <div class="search--form-group">
                        <button type="button" class="btn"><i class="tio-search"></i></button>
                        <input type="text" id="search" class="form-control form--control"
                            placeholder="<?php echo e(translate('messages.Search_Menu...')); ?>">
                    </div>
                </form> -->
                <!-- Search Form -->
                <ul class="navbar-nav navbar-nav-lg nav-tabs pt-3">
                    <!-- Dashboards -->
                    <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin') ? 'active' : ''); ?>">
                        <a class="js-navbar-vertical-aside-menu-link nav-link" href="<?php echo e(route('admin.dashboard')); ?>"
                            title="<?php echo e(translate('messages.dashboard')); ?>">
                            <i class="tio-dashboard-vs nav-icon"></i>
                            <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                <?php echo e(translate('messages.dashboard')); ?>

                            </span>
                        </a>
                    </li>
                    <!-- End Dashboards -->
                    <?php if(\App\CentralLogics\Helpers::module_permission_check('pos')): ?>
                        <!-- POS -->
                        <!-- <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/pos') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link"
                                href="<?php echo e(route('admin.pos.index')); ?>" title="<?php echo e(translate('messages.pos')); ?>">
                                <i class="tio-receipt nav-icon"></i>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.pos')); ?></span>
                            </a>
                        </li> -->
                        <!-- End POS -->
                    <?php endif; ?>

                    <!-- Marketing section -->
                    <li class="nav-item">
                        <small class="nav-subtitle"
                            title="<?php echo e(translate('Promotion_management')); ?>"><?php echo e(translate('Promotions_management')); ?></small>
                        <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                    </li>
                    <!-- Campaign -->
                    <?php if(\App\CentralLogics\Helpers::module_permission_check('campaign')): ?>
                        <!-- <li
                            class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/campaign*') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                                title="<?php echo e(translate('messages.campaigns')); ?>">
                                <i class="tio-notice nav-icon"></i>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.campaigns')); ?></span>
                            </a>
                            <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                                style="display: <?php echo e(Request::is('admin/campaign*') ? 'block' : 'none'); ?>">

                                <li class="nav-item <?php echo e(Request::is('admin/campaign/basic/*') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.campaign.list', 'basic')); ?>"
                                        title="<?php echo e(translate('messages.basic_campaign')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate"><?php echo e(translate('messages.basic_campaign')); ?></span>
                                    </a>
                                </li>
                                <li class="nav-item <?php echo e(Request::is('admin/campaign/item/*') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.campaign.list', 'item')); ?>"
                                        title="<?php echo e(translate('messages.food_campaign')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate"><?php echo e(translate('messages.food_campaign')); ?></span>
                                    </a>
                                </li>
                            </ul>
                        </li> -->
                    <?php endif; ?>
                    <!-- End Campaign -->
                    <!-- Banner -->
                    <?php if(\App\CentralLogics\Helpers::module_permission_check('banner')): ?>
                        <!-- <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/banner*') && !Request::is('admin/banner/promotional-banner*') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link"
                                href="<?php echo e(route('admin.banner.add-new')); ?>"
                                title="<?php echo e(translate('messages.banners')); ?>">
                                <i class="tio-bookmark nav-icon side-nav-icon--design"></i>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.banners')); ?></span>
                            </a>
                        </li>
                        <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/banner/promotional-banner*') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link"
                                href="<?php echo e(route('admin.banner.promotional_banner')); ?>"
                                title="<?php echo e(translate('messages.promotional_banner')); ?>">
                                <i class="tio-tabs nav-icon side-nav-icon--design"></i>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.promotional_banner')); ?></span>
                            </a>
                        </li> -->
                    <?php endif; ?>
                    <!-- End Banner -->
                    <!-- Coupon -->
                    <?php if(\App\CentralLogics\Helpers::module_permission_check('coupon')): ?>
                        <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/coupon*') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link"
                                href="<?php echo e(route('admin.coupon.add-new')); ?>"
                                title="<?php echo e(translate('messages.coupons')); ?>">
                                <i class="tio-ticket nav-icon"></i>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.coupons')); ?></span>
                            </a>
                        </li>
                    <?php endif; ?>
                    <!-- End Coupon -->
                    <!-- Notification -->
                    <?php if(\App\CentralLogics\Helpers::module_permission_check('notification')): ?>
                        <li
                            class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/notification*') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link"
                                href="<?php echo e(route('admin.notification.add-new')); ?>"
                                title="<?php echo e(translate('messages.push_notification')); ?>">
                                <i class="tio-notifications-on nav-icon"></i>
                                <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                    <?php echo e(translate('messages.push_notification')); ?>

                                </span>
                            </a>
                        </li>
                    <?php endif; ?>
                    <!-- End Notification -->
                    <!-- Orders -->
                    <?php if(\App\CentralLogics\Helpers::module_permission_check('order')): ?>
                        <li class="nav-item">
                            <small class="nav-subtitle"><?php echo e(translate('messages.order_management')); ?></small>
                            <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                        </li>

                        <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/order*')  ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                                title="<?php echo e(translate('messages.orders')); ?>">
                                <i class="tio-file-text-outlined nav-icon"></i>
                                <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                    <?php echo e(translate('messages.orders')); ?>

                                </span>
                            </a>
                            <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                                style="display: <?php echo e(Request::is('admin/order*') && (Request::is('admin/order/subscription*') == false &&  Request::is('admin/order-cancel-reasons') ==false) ? 'block' : 'none'); ?>">
                                <li class="nav-item <?php echo e(Request::is('admin/order/list/all') ? 'active' : ''); ?> <?php echo $__env->yieldContent('all_order'); ?>">
                                    <a class="nav-link" href="<?php echo e(route('admin.order.list', ['all'])); ?>"
                                        title="<?php echo e(translate('messages.all_orders')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate sidebar--badge-container">
                                            <?php echo e(translate('messages.all')); ?>

                                            <span class="badge badge-soft-info badge-pill ml-1">
                                                
                                                <?php echo e($order->total); ?>

                                            </span>
                                        </span>
                                    </a>
                                </li>
                                <li class="nav-item <?php echo e(Request::is('admin/order/list/scheduled') ? 'active' : ''); ?> <?php echo $__env->yieldContent('scheduled'); ?>">
                                    <a class="nav-link" href="<?php echo e(route('admin.order.list', ['scheduled'])); ?>"
                                        title="<?php echo e(translate('messages.scheduled_orders')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate sidebar--badge-container">
                                            <?php echo e(translate('messages.scheduled')); ?>

                                            <span class="badge badge-soft-info badge-pill ml-1">
                                                
                                                <?php echo e($order->scheduled); ?>

                                            </span>
                                        </span>
                                    </a>
                                </li>
                                <li class="nav-item <?php echo e(Request::is('admin/order/list/pending') ? 'active' : ''); ?> <?php echo $__env->yieldContent('pending'); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.order.list', ['pending'])); ?>"
                                        title="<?php echo e(translate('messages.pending_orders')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate sidebar--badge-container">
                                            <?php echo e(translate('messages.pending')); ?>

                                            <span class="badge badge-soft-info badge-pill ml-1">
                                                
                                                <?php echo e($order_sch->pending); ?>

                                            </span>
                                        </span>
                                    </a>
                                </li>

                                <li class="nav-item <?php echo e(Request::is('admin/order/list/accepted') ? 'active' : ''); ?> <?php echo $__env->yieldContent('accepted'); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.order.list', ['accepted'])); ?>"
                                        title="<?php echo e(translate('messages.accepted_orders')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate sidebar--badge-container">
                                            <?php echo e(translate('messages.accepted')); ?>

                                            <span class="badge badge-soft-success badge-pill ml-1">
                                                

                                                <?php echo e($order_sch->accepted); ?>


                                            </span>
                                        </span>
                                    </a>
                                </li>
                                <li class="nav-item <?php echo e(Request::is('admin/order/list/processing') ? 'active' : ''); ?> <?php echo $__env->yieldContent('processing'); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.order.list', ['processing'])); ?>"
                                        title="<?php echo e(translate('messages.processing_orders')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate sidebar--badge-container">
                                            <?php echo e(translate('messages.processing')); ?>

                                            <span class="badge badge-soft-warning badge-pill ml-1">
                                                
                                                <?php echo e($order->processing); ?>

                                            </span>
                                        </span>
                                    </a>
                                </li>
                                <li
                                    class="nav-item <?php echo e(Request::is('admin/order/list/food_on_the_way') ? 'active' : ''); ?> <?php echo $__env->yieldContent('picked_up'); ?>">
                                    <a class="nav-link text-capitalize"
                                        href="<?php echo e(route('admin.order.list', ['food_on_the_way'])); ?>"
                                        title="<?php echo e(translate('messages.foodOnTheWay_orders')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate sidebar--badge-container">
                                            <?php echo e(translate('messages.food_On_The_Way')); ?>

                                            <span class="badge badge-soft-warning badge-pill ml-1">
                                                
                                                <?php echo e($order_sch->picked_up); ?>


                                            </span>
                                        </span>
                                    </a>
                                </li>
                                <li class="nav-item <?php echo e(Request::is('admin/order/list/delivered') ? 'active' : ''); ?> <?php echo $__env->yieldContent('delivered'); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.order.list', ['delivered'])); ?>"
                                        title="<?php echo e(translate('messages.delivered_orders')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate sidebar--badge-container">
                                            <?php echo e(translate('messages.delivered')); ?>

                                            <span class="badge badge-soft-success badge-pill ml-1">
                                                
                                                <?php echo e($order->delivered); ?>

                                            </span>
                                        </span>
                                    </a>
                                </li>
                                <li class="nav-item <?php echo e(Request::is('admin/order/list/canceled') ? 'active' : ''); ?> <?php echo $__env->yieldContent('canceled'); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.order.list', ['canceled'])); ?>"
                                        title="<?php echo e(translate('messages.canceled_orders')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate sidebar--badge-container">
                                            <?php echo e(translate('messages.canceled')); ?>

                                            <span class="badge badge-soft-danger badge-pill ml-1">
                                                
                                                <?php echo e($order->canceled); ?>

                                            </span>
                                        </span>
                                    </a>
                                </li>
                                <li class="nav-item <?php echo e(Request::is('admin/order/list/failed') ? 'active' : ''); ?> <?php echo $__env->yieldContent('failed'); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.order.list', ['failed'])); ?>"
                                        title="<?php echo e(translate('messages.payment_failed_orders')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate sidebar--badge-container text-capitalize">
                                            <?php echo e(translate('messages.payment_failed')); ?>

                                            <span class="badge badge-soft-danger badge-pill ml-1">
                                                
                                                <?php echo e($order->failed); ?>

                                            </span>
                                        </span>
                                    </a>
                                </li>
                                <li class="nav-item <?php echo e(Request::is('admin/order/list/refunded') ? 'active' : ''); ?> <?php echo $__env->yieldContent('refunded'); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.order.list', ['refunded'])); ?>"
                                        title="<?php echo e(translate('messages.refunded_orders')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate sidebar--badge-container">
                                            <?php echo e(translate('messages.refunded')); ?>

                                            <span class="badge badge-soft-danger badge-pill ml-1">
                                                
                                                <?php echo e($order->refunded); ?>

                                            </span>
                                        </span>
                                    </a>
                                </li>

                                <li class="nav-item <?php echo e(Request::is('admin/order/offline/payment/list*') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.order.offline_verification_list', ['all'])); ?>" title="<?php echo e(translate('Offline_Payments')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate sidebar--badge-container">
                                            <?php echo e(translate('messages.Offline_Payments')); ?>

                                            <span class="badge badge-soft-danger bg-light badge-pill ml-1">
                                                <?php echo e(\App\Models\Order::has('offline_payments')->Notpos()->count()); ?>

                                            </span>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </li>


                        <!-- <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/order/subscription*') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link" href="<?php echo e(route('admin.order.subscription.index')); ?>" title="<?php echo e(translate('messages.Subscription_orders')); ?> ">
                                <i class="tio-appointment nav-icon"></i>
                                <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                      <?php echo e(translate('messages.Subscription_orders')); ?></span>
                            </a>
                        </li> -->

                        <!-- Order refund -->
                        <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/refund/*') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                                title="<?php echo e(translate('messages.Order_Refunds')); ?>">
                                <i class="tio-receipt nav-icon"></i>
                                <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                    <?php echo e(translate('messages.Order_Refunds')); ?>

                                </span>
                            </a>
                            <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                                style="display: <?php echo e(Request::is('admin/refund*') ? 'block' : 'none'); ?>">
                                <li class="nav-item <?php echo e(Request::is('admin/refund/requested') || Request::is('admin/refund/refunded') ||
                                Request::is('admin/refund/rejected') ? 'active' : ''); ?>">
                                    <a class="nav-link "
                                        href="<?php echo e(route('admin.refund.refund_attr', ['requested'])); ?>"
                                        title="<?php echo e(translate('messages.New_Refund_Requests')); ?> ">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate sidebar--badge-container">
                                            <?php echo e(translate('messages.New_Refund_Requests')); ?>

                                            <span class="badge badge-soft-danger badge-pill ml-1">
                                                
                                                <?php echo e($order->refund_requested); ?>

                                            </span>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!-- Order refund End-->


                        <!-- Order dispachment -->
                        <li
                            class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/dispatch/*') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                                title="<?php echo e(translate('messages.Dispatch_Management')); ?>">
                                <i class="tio-clock nav-icon"></i>
                                <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                    <?php echo e(translate('messages.Dispatch_Management')); ?>

                                </span>
                            </a>
                            <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                                style="display: <?php echo e(Request::is('admin/dispatch*') ? 'block' : 'none'); ?>">
                                <li
                                    class="nav-item <?php echo e(Request::is('admin/dispatch/list/searching_for_deliverymen') ? 'active' : ''); ?>">
                                    <a class="nav-link "
                                        href="<?php echo e(route('admin.dispatch.list', ['searching_for_deliverymen'])); ?>"
                                        title="<?php echo e(translate('messages.searching_DeliveryMan')); ?> <?php echo e($order_sch->searching_dm); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate">
                                            <?php echo e(translate('messages.searching_DeliveryMan')); ?>

                                            <span class="badge badge-soft-info badge-pill ml-1">
                                                
                                                <?php echo e($order_sch->searching_dm); ?>

                                            </span>
                                        </span>
                                    </a>
                                </li>
                                <li
                                    class="nav-item <?php echo e(Request::is('admin/dispatch/list/on_going') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.dispatch.list', ['on_going'])); ?>"
                                        title="<?php echo e(translate('messages.ongoing_Orders')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate sidebar--badge-container">
                                            <?php echo e(translate('messages.ongoing_Orders')); ?>

                                            <span class="badge badge-soft-dark bg-light badge-pill ml-1">
                                                
                                                <?php echo e($order_sch->ongoing); ?>

                                            </span>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!-- Order dispachment End-->
                    <?php endif; ?>
                    <!-- End Orders -->

                    <li class="nav-item">
                        <small class="nav-subtitle"><?php echo e(translate('messages.Help_&_Support')); ?></small>
                            <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                    </li>

                    <?php if(\App\CentralLogics\Helpers::module_permission_check('customerList')): ?>
                        <li  class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/message/list') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link"
                                href="<?php echo e(route('admin.message.list')); ?>"
                                title="<?php echo e(translate('messages.Chattings')); ?>">
                                <i class="tio-chat nav-icon"></i>
                                <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                    <?php echo e(translate('messages.Chattings')); ?>

                                </span>
                            </a>
                        </li>
                    <?php endif; ?>
                    <?php if(\App\CentralLogics\Helpers::module_permission_check('contact_message')): ?>
                        <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/contact/*') ? 'active' : ''); ?>">
                        <a class="js-navbar-vertical-aside-menu-link nav-link"
                            href="<?php echo e(route('admin.contact.list')); ?>"
                            title="<?php echo e(translate('messages.Contact_messages')); ?>">
                            <i class="tio-messages nav-icon"></i>
                            <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                <?php echo e(translate('messages.Contact_messages')); ?>

                            </span>
                        </a>
                        </li>
                    <?php endif; ?>


                    <!-- Restaurant -->
                    <li class="nav-item">
                        <small class="nav-subtitle"
                            title="<?php echo e(translate('messages.restaurant_section')); ?>"><?php echo e(translate('messages.restaurant_management')); ?></small>
                        <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                    </li>

                    <?php if(\App\CentralLogics\Helpers::module_permission_check('zone')): ?>
                        <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/zone*') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link"
                                href="<?php echo e(route('admin.zone.home')); ?>"
                                title="<?php echo e(translate('messages.zone_setup')); ?>">
                                <i class="tio-poi-outlined nav-icon"></i>
                                <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                    <?php echo e(translate('messages.zone_setup')); ?></span>
                            </a>
                        </li>
                    <?php endif; ?>
                    <?php if(\App\CentralLogics\Helpers::module_permission_check('restaurant')): ?>
                    <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/cuisine/add') ? 'active' : ''); ?>">
                        <a class="js-navbar-vertical-aside-menu-link nav-link"
                            href="<?php echo e(route('admin.cuisine.add')); ?>"
                            title="<?php echo e(translate('messages.cuisine')); ?>">
                            <i class="tio-link nav-icon"></i>
                            <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                <?php echo e(translate('messages.cuisine')); ?>

                        </a>
                    </li>

                        <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/restaurant*') && !Request::is('admin/restaurant/withdraw_list') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                                title="<?php echo e(translate('messages.restaurants')); ?>">
                                <i class="tio-restaurant nav-icon"></i>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.restaurants')); ?></span>
                            </a>
                            <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                                style="display: <?php echo e((Request::is('admin/restaurant*') && !Request::is('admin/restaurant/withdraw_list') ||
                                stripos(Request()->fullurl(), 'pending-list', 5) ) ? 'block' : 'none'); ?>">
                                <?php echo e(stripos(Request()->fullurl(), 'pending-list', 5 )); ?>

                                <li
                                    class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/restaurant/add') ? 'active' : ''); ?>">
                                    <a class="js-navbar-vertical-aside-menu-link nav-link"
                                        href="<?php echo e(route('admin.restaurant.add')); ?>"
                                        title="<?php echo e(translate('messages.add_restaurant')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                            <?php echo e(translate('messages.add_restaurant')); ?>

                                        </span>
                                    </a>
                                </li>

                                <li class="navbar-item <?php echo e(!stripos(Request()->fullurl(), 'pending-list', 5 ) && (Request::is('admin/restaurant/list') ||  Request::is('admin/restaurant/transcation/*') || Request::is('admin/restaurant/view*')) ? 'active' : ''); ?> ">
                                    <a class="js-navbar-vertical-aside-menu-link nav-link"
                                        href="<?php echo e(route('admin.restaurant.list')); ?>"
                                        title="<?php echo e(translate('messages.restaurants_list')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span
                                            class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.restaurants_list')); ?></span>
                                    </a>
                                </li>

                                <li class="navbar-item <?php echo e(stripos(Request()->fullurl(), 'pending-list', 5 ) || Request::is('admin/restaurant/pending/list*') ||  Request::is('admin/restaurant/denied/list*') ? 'active' : ''); ?>">
                                    <a class="js-navbar-vertical-aside-menu-link nav-link"
                                        href="<?php echo e(route('admin.restaurant.pending')); ?>"
                                        title="<?php echo e(translate('messages.New_joining_request')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span  class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.New_joining_request')); ?>

                                        </span>
                                    </a>
                                </li>

                                <li
                                    class="nav-item <?php echo e(Request::is('admin/restaurant/bulk-import') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.restaurant.bulk-import')); ?>"
                                        title="<?php echo e(translate('messages.bulk_import')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span
                                            class="text-truncate text-capitalize"><?php echo e(translate('messages.bulk_import')); ?></span>
                                    </a>
                                </li>
                                <li
                                    class="nav-item <?php echo e(Request::is('admin/restaurant/bulk-export') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.restaurant.bulk-export-index')); ?>"
                                        title="<?php echo e(translate('messages.bulk_export')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span
                                            class="text-truncate text-capitalize"><?php echo e(translate('messages.bulk_export')); ?></span>
                                    </a>
                                </li>

                            </ul>
                        </li>


                    <?php endif; ?>
                <!-- End Restaurant -->
                    <li class="nav-item">
                        <small class="nav-subtitle"
                            title="<?php echo e(translate('messages.food_section')); ?>"><?php echo e(translate('messages.food_management')); ?></small>
                        <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                    </li>

                    <!-- Category -->
                    <?php if(\App\CentralLogics\Helpers::module_permission_check('category')): ?>
                        <li
                            class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/category*')  ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                                title="<?php echo e(translate('messages.categories')); ?>">
                                <i class="tio-category nav-icon"></i>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.categories')); ?></span>
                            </a>
                            <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                                style="display: <?php echo e(Request::is('admin/category*') ? 'block' : 'none'); ?>">


                                <li class="nav-item <?php echo e(Request::is('admin/category/add') ||  Request::is('admin/category/edit/*') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.category.add')); ?>"
                                        title="<?php echo e(translate('messages.category')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate"><?php echo e(translate('messages.category')); ?></span>
                                    </a>
                                </li>

                                <li
                                    class="nav-item <?php echo e(Request::is('admin/category/add-sub-category') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.category.add-sub-category')); ?>"
                                        title="<?php echo e(translate('messages.sub_category')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate"><?php echo e(translate('messages.sub_category')); ?></span>
                                    </a>
                                </li>

                                
                                <li class="nav-item <?php echo e(Request::is('admin/category/bulk-import') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.category.bulk-import')); ?>"
                                        title="<?php echo e(translate('messages.bulk_import')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span
                                            class="text-truncate text-capitalize"><?php echo e(translate('messages.bulk_import')); ?></span>
                                    </a>
                                </li>
                                <li class="nav-item <?php echo e(Request::is('admin/category/bulk-export') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.category.bulk-export-index')); ?>"
                                        title="<?php echo e(translate('messages.bulk_export')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span
                                            class="text-truncate text-capitalize"><?php echo e(translate('messages.bulk_export')); ?></span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    <?php endif; ?>
                    <!-- End Category -->

                    <!-- AddOn -->
                    <?php if(\App\CentralLogics\Helpers::module_permission_check('addon')): ?>
                        <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/addon*') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                                title="<?php echo e(translate('messages.addons')); ?>">
                                <i class="tio-add-circle-outlined nav-icon"></i>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.addons')); ?></span>
                            </a>
                            <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                                style="display: <?php echo e(Request::is('admin/addon*') ? 'block' : 'none'); ?>">
                                <li class="nav-item <?php echo e(Request::is('admin/addon/add-new') || Request::is('admin/addon/edit/*') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.addon.add-new')); ?>"
                                        title="<?php echo e(translate('messages.addon_list')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate"><?php echo e(translate('messages.list')); ?></span>
                                    </a>
                                </li>

                                <li class="nav-item <?php echo e(Request::is('admin/addon/bulk-import') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.addon.bulk-import')); ?>"
                                        title="<?php echo e(translate('messages.bulk_import')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span
                                            class="text-truncate text-capitalize"><?php echo e(translate('messages.bulk_import')); ?></span>
                                    </a>
                                </li>
                                <li class="nav-item <?php echo e(Request::is('admin/addon/bulk-export') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.addon.bulk-export-index')); ?>"
                                        title="<?php echo e(translate('messages.bulk_export')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span
                                            class="text-truncate text-capitalize"><?php echo e(translate('messages.bulk_export')); ?></span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    <?php endif; ?>
                    <!-- End AddOn -->
                    <!-- Food -->
                    <?php if(\App\CentralLogics\Helpers::module_permission_check('food')): ?>
                        <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/food*') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                                title="<?php echo e(translate('messages.foods')); ?>">
                                <i class="tio-fastfood nav-icon"></i>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.foods')); ?></span>
                            </a>
                            <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                                style="display: <?php echo e(Request::is('admin/food*') ? 'block' : 'none'); ?>">
                                <li class="nav-item <?php echo e(Request::is('admin/food/add-new') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.food.add-new')); ?>"
                                        title="<?php echo e(translate('messages.add_new')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate"><?php echo e(translate('messages.add_new')); ?></span>
                                    </a>
                                </li>
                                <li class="nav-item <?php echo e(Request::is('admin/food/list')  ||  Request::is('admin/food/view/*') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.food.list')); ?>"
                                        title="<?php echo e(translate('messages.food_list')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate"><?php echo e(translate('messages.list')); ?></span>
                                    </a>
                                </li>
                                <li class="nav-item <?php echo e(Request::is('admin/food/reviews') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.food.reviews')); ?>"
                                        title="<?php echo e(translate('messages.review_list')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate"><?php echo e(translate('messages.review')); ?></span>
                                    </a>
                                </li>
                                <li class="nav-item <?php echo e(Request::is('admin/food/bulk-import') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.food.bulk-import')); ?>"
                                        title="<?php echo e(translate('messages.bulk_import')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span
                                            class="text-truncate text-capitalize"><?php echo e(translate('messages.bulk_import')); ?></span>
                                    </a>
                                </li>
                                <li class="nav-item <?php echo e(Request::is('admin/food/bulk-export') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.food.bulk-export-index')); ?>"
                                        title="<?php echo e(translate('messages.bulk_export')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span
                                            class="text-truncate text-capitalize"><?php echo e(translate('messages.bulk_export')); ?></span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    <?php endif; ?>
                    <!-- End Food -->
                    <!-- DeliveryMan -->
                    <?php if(\App\CentralLogics\Helpers::module_permission_check('deliveryman')): ?>
                        <li class="nav-item">
                            <small class="nav-subtitle"
                                title="<?php echo e(translate('messages.deliveryman_section')); ?>"><?php echo e(translate('messages.deliveryman_management')); ?></small>
                            <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                        </li>


                        <li
                            class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/vehicle/*') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link"
                                href="<?php echo e(route('admin.vehicle.list')); ?>"
                                title="<?php echo e(translate('messages.vehicles_category_setup')); ?>">
                                <i class="tio-car nav-icon"></i>
                                <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                    <?php echo e(translate('messages.vehicles_category_setup')); ?>

                                </span>
                            </a>
                        </li>
                        <!-- <li
                            class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/shift*') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link"
                                href="<?php echo e(route('admin.shift.list')); ?>"
                                title="<?php echo e(translate('messages.Shift_setup')); ?>">
                                <i class="tio-calendar nav-icon"></i>
                                <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                    <?php echo e(translate('messages.Shift_setup')); ?>

                                </span>
                            </a>
                        </li> -->

                        <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/delivery-man*') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                                title="<?php echo e(translate('messages.deliveryman')); ?>">
                                <i class="tio-running nav-icon"></i>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.deliveryman')); ?></span>
                            </a>

                            <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                                style="display: <?php echo e(Request::is('admin/delivery-man*') ? 'block' : 'none'); ?>">

                                <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/delivery-man/edit/*') || Request::is('admin/delivery-man/list') || Request::is('admin/delivery-man/preview/*')? 'active' : ''); ?>">
                                    <a class="js-navbar-vertical-aside-menu-link nav-link"
                                        href="<?php echo e(route('admin.delivery-man.list')); ?>"
                                        title="<?php echo e(translate('messages.deliveryman_list')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                            <?php echo e(translate('messages.deliveryman_list')); ?>

                                        </span>
                                    </a>
                                </li>
                                <li class="nav-item <?php echo e(Request::is('admin/delivery-man/add') ? 'active' : ''); ?>">
                                    <a class="nav-link"
                                        href="<?php echo e(route('admin.delivery-man.add')); ?>"
                                        title="<?php echo e(translate('messages.add_delivery_man')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                            <?php echo e(translate('messages.add_new_delivery_man')); ?>

                                        </span>
                                    </a>
                                </li>

                                <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/delivery-man/pending-delivery-man-view/*') ||  Request::is('admin/delivery-man/pending/list') || Request::is('admin/delivery-man/denied/list') ? 'active' : ''); ?>">
                                    <a class="js-navbar-vertical-aside-menu-link nav-link"
                                        href="<?php echo e(route('admin.delivery-man.pending')); ?>"
                                        title="<?php echo e(translate('messages.New_joining_request')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                            <?php echo e(translate('messages.New_joining_request')); ?>

                                        </span>
                                    </a>
                                </li>
                                <!-- <li  class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/delivery-man/incentive') ? 'active' : ''); ?>">
                                    <a class="js-navbar-vertical-aside-menu-link nav-link"
                                        href="<?php echo e(route('admin.delivery-man.incentive')); ?>"
                                        title=" <?php echo e(translate('messages.incentive_Requests')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                            <?php echo e(translate('messages.incentive_Requests')); ?>

                                        </span>
                                    </a>
                                </li>
                                <li  class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/delivery-man/incentive-history') ? 'active' : ''); ?>">
                                    <a class="js-navbar-vertical-aside-menu-link nav-link" href="<?php echo e(route('admin.delivery-man.incentive-history')); ?>"
                                        title="<?php echo e(translate('messages.incentives_history')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span
                                            class="text-truncate text-capitalize"><?php echo e(translate('messages.incentives_history')); ?></span>
                                    </a>
                                </li>
                                <li  class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/delivery-man/bonus') ? 'active' : ''); ?>">
                                    <a class="js-navbar-vertical-aside-menu-link nav-link" href="<?php echo e(route('admin.delivery-man.bonus')); ?>"
                                        title="<?php echo e(translate('messages.bonus')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span
                                            class="text-truncate text-capitalize"><?php echo e(translate('messages.bonus')); ?></span>
                                    </a>
                                </li>

                                <li  class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/delivery-man/reviews/list') ? 'active' : ''); ?>">
                                <a class="js-navbar-vertical-aside-menu-link nav-link"
                                    href="<?php echo e(route('admin.delivery-man.reviews.list')); ?>"
                                    title="<?php echo e(translate('messages.reviews')); ?>">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                        <?php echo e(translate('messages.reviews')); ?>

                                    </span>
                                </a>
                            </li> -->

                            </ul>
                        </li>
                    <?php endif; ?>
                    <!-- End DeliveryMan -->
                    <?php if(\App\CentralLogics\Helpers::module_permission_check('customerList')): ?>
                        <!-- Custommer -->
                        <li class="nav-item">
                            <small class="nav-subtitle"
                                title="<?php echo e(translate('messages.customer_section')); ?>"><?php echo e(translate('messages.customer_management')); ?></small>
                            <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                        </li>


                        <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/customer/list') || Request::is('admin/customer/view*') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link"
                                href="<?php echo e(route('admin.customer.list')); ?>"
                                title="<?php echo e(translate('messages.Customer_List')); ?>">
                                <i class="tio-poi-user nav-icon"></i>
                                <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                    <?php echo e(translate('messages.customeres')); ?>

                                </span>
                            </a>
                        </li>
                        

                        <?php if(\App\CentralLogics\Helpers::module_permission_check('customer_wallet')): ?>
                        <li
                            class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/customer/wallet*') ? 'active' : ''); ?>">

                            <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                                title="<?php echo e(translate('messages.Customer_Wallet')); ?>">
                                <i class="tio-wallet nav-icon"></i>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate  text-capitalize">
                                    <?php echo e(translate('messages.wallet')); ?>

                                </span>
                            </a>

                            <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                                style="display: <?php echo e(Request::is('admin/customer/wallet*') ? 'block' : 'none'); ?>">
                                <li
                                    class="nav-item <?php echo e(Request::is('admin/customer/wallet/add-fund') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.customer.wallet.add-fund')); ?>"
                                        title="<?php echo e(translate('messages.add_fund')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span
                                            class="text-truncate text-capitalize"><?php echo e(translate('messages.add_fund')); ?></span>
                                    </a>
                                </li>
                                <li class="nav-item <?php echo e(Request::is('admin/customer/wallet/bonus*') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.customer.wallet.bonus.add-new')); ?>" title="<?php echo e(translate('messages.bonus')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate text-capitalize"><?php echo e(translate('messages.bonus')); ?></span>
                                    </a>
                                </li>

                            </ul>
                        </li>
                        <?php endif; ?>
                        <!-- <li
                            class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/customer/loyalty-point*') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link  nav-link-toggle" href="javascript:"
                                title="<?php echo e(translate('messages.loyalty_point')); ?>">
                                <i class="tio-medal nav-icon"></i>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate  text-capitalize">
                                    <?php echo e(translate('messages.loyalty_point')); ?>

                                </span>
                            </a>

                            <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                                style="display: <?php echo e(Request::is('admin/customer/loyalty-point*') ? 'block' : 'none'); ?>">
                                <li  class="nav-item <?php echo e(Request::is('admin/customer/loyalty-point/report*') ? 'active' : ''); ?>">
                                        <a class="nav-link " href="<?php echo e(route('admin.customer.loyalty-point.report')); ?>"
                                            title="<?php echo e(translate('messages.report')); ?>">
                                            <span class="tio-circle nav-indicator-icon"></span>
                                            <span
                                                class="text-truncate text-capitalize"><?php echo e(translate('messages.report')); ?></span>
                                        </a>
                                    </li>
                                </ul>
                            </li> -->
                            <!-- <li
                                class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/customer/subscribed') ? 'active' : ''); ?>">
                                <a class="js-navbar-vertical-aside-menu-link nav-link"
                                    href="<?php echo e(route('admin.customer.subscribed')); ?>"
                                    title="<?php echo e(translate('messages.Subscribed_Emails')); ?>">
                                    <i class="tio-email-outlined nav-icon"></i>
                                    <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                        <?php echo e(translate('messages.subscribed_mail_list')); ?>

                                    </span>
                                </a>
                            </li> -->
                        </li>
                    <?php endif; ?>
                    <!-- End Custommer -->


                    <!-- Employee-->
                    <!-- <li class="nav-item">
                        <small class="nav-subtitle"
                            title="<?php echo e(translate('messages.employee_handle')); ?>"><?php echo e(translate('messages.Employee_Management')); ?></small>
                        <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                    </li> -->

                    <?php if(\App\CentralLogics\Helpers::module_permission_check('custom_role')): ?>
                        <!-- <li
                            class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/custom-role*') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link"
                                href="<?php echo e(route('admin.custom-role.create')); ?>"
                                title="<?php echo e(translate('messages.employee_Role')); ?>">
                                <i class="tio-incognito nav-icon"></i>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.employee_Role')); ?></span>
                            </a>
                        </li> -->
                    <?php endif; ?>

                    <?php if(\App\CentralLogics\Helpers::module_permission_check('employee')): ?>
                        <!-- <li
                            class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/employee*') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                                title="<?php echo e(translate('Employees')); ?>">
                                <i class="tio-user nav-icon"></i>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.employees')); ?></span>
                            </a>
                            <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                                style="display: <?php echo e(Request::is('admin/employee*') ? 'block' : 'none'); ?>">
                                <li class="nav-item <?php echo e(Request::is('admin/employee/add-new') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.employee.add-new')); ?>"
                                        title="<?php echo e(translate('messages.add_new_Employee')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate"><?php echo e(translate('messages.add_new')); ?></span>
                                    </a>
                                </li>
                                <li class="nav-item <?php echo e(Request::is('admin/employee/list')  ||  Request::is('admin/employee/update/*') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.employee.list')); ?>"
                                        title="<?php echo e(translate('messages.Employee_list')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate"><?php echo e(translate('messages.list')); ?></span>
                                    </a>
                                </li>

                            </ul>
                        </li> -->
                    <?php endif; ?>
                    <!-- End Employee -->

                    <!-- Report -->
                    <?php if(\App\CentralLogics\Helpers::module_permission_check('report')): ?>
                        <li class="nav-item">
                            <small class="nav-subtitle"
                                title="<?php echo e(translate('messages.report_and_analytics')); ?>"><?php echo e(translate('messages.report_management')); ?></small>
                            <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                        </li>

                        <li
                            class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/report/transaction-report') ? 'active' : ''); ?>">
                            <a class="nav-link " href="<?php echo e(route('admin.report.day-wise-report')); ?>"
                                title="<?php echo e(translate('messages.transaction_report')); ?>">
                                <span class="tio-chart-pie-1 nav-icon"></span>
                                <span class="text-truncate"><?php echo e(translate('messages.transaction_report')); ?></span>
                            </a>
                        </li>

                        <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/report/expense-report') ? 'active' : ''); ?>">
                            <a class="nav-link " href="<?php echo e(route('admin.report.expense-report')); ?>" title="<?php echo e(translate('messages.expense_report')); ?>">
                                <span class="tio-image  nav-icon"></span>
                                <span class="text-truncate"><?php echo e(translate('messages.expense_report')); ?></span>
                            </a>
                        </li>

                        <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/report/food-wise-report') ? 'active' : ''); ?>">
                            <a class="nav-link " href="<?php echo e(route('admin.report.food-wise-report')); ?>"
                                title="<?php echo e(translate('messages.food_report')); ?>">
                                <span class="tio-fastfood nav-icon"></span>
                                <span class="text-truncate"><?php echo e(translate('messages.food_report')); ?></span>
                            </a>
                        </li>
                        <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/report/disbursement-report') ? 'active' : ''); ?>">
                            <a class="nav-link " href="<?php echo e(route('admin.report.disbursement_report')); ?>"
                                title="<?php echo e(translate('messages.disbursement_report')); ?>">
                                <span class="tio-saving nav-icon"></span>
                                <span class="text-truncate"><?php echo e(translate('messages.disbursement_report')); ?></span>
                            </a>
                        </li>

                        <li class="navbar-vertical-aside-has-menu  <?php echo e(Request::is('admin/report/order-report') || Request::is('admin/report/campaign-order-report') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                                title="<?php echo e(translate('messages.Order_Report')); ?>">
                                <i class="tio-user nav-icon"></i>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.Order_Report')); ?></span>
                            </a>
                            <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                                style="display: <?php echo e(Request::is('admin/report/order-report') || Request::is('admin/report/campaign-order-report') ? 'block' : 'none'); ?>">
                                <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/report/order-report') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.report.order-report')); ?>" title="<?php echo e(translate('messages.order_report')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate text-capitalize"><?php echo e(translate('messages.Regular_order_report')); ?></span>
                                    </a>
                                </li>
                                <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/report/campaign-order-report') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.report.campaign_order-report')); ?>" title="<?php echo e(translate('messages.Campaign_Order_Report')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate text-capitalize"><?php echo e(translate('messages.Campaign_Order_Report')); ?></span>
                                    </a>
                                </li>
                            </ul>
                        </li>


                        <li class="navbar-vertical-aside-has-menu   <?php echo e(Request::is('admin/report/subscription-report') || Request::is('admin/report/restaurant-report')  ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                                title="<?php echo e(translate('messages.restaurant_report')); ?>">
                                <span class="tio-files nav-icon"></span>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.restaurant_report')); ?></span>
                            </a>
                            <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                                style="display: <?php echo e(Request::is('admin/report/subscription-report') || Request::is('admin/report/restaurant-report')  ? 'block' : 'none'); ?>">

                                <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/report/restaurant-report') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.report.restaurant-report')); ?>"
                                        title="<?php echo e(translate('messages.restaurant_report')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate"><?php echo e(translate('messages.restaurant_report')); ?></span>
                                    </a>
                                </li>
                                <?php if(\App\CentralLogics\Helpers::subscription_check() == true  ): ?>
                                <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/report/subscription-report') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.report.subscription-report')); ?>"
                                        title="<?php echo e(translate('messages.Subscription_report')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate"><?php echo e(translate('messages.Subscription_report')); ?></span>
                                    </a>
                                </li>
                                <?php endif; ?>
                            </ul>
                        </li>
                        <li class="navbar-vertical-aside-has-menu   <?php echo e(Request::is('admin/customer/wallet/report*')  ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                                title="<?php echo e(translate('messages.Customer_Report')); ?>">
                                <span class="tio-poi-user nav-icon"></span>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.Customer_Report')); ?></span>
                            </a>
                            <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                                style="display: <?php echo e(Request::is('admin/customer/wallet/report*')  ? 'block' : 'none'); ?>">

                                <li  class="nav-item <?php echo e(Request::is('admin/customer/wallet/report*') ? 'active' : ''); ?>">
                                <a class="nav-link " href="<?php echo e(route('admin.customer.wallet.report')); ?>"
                                    title="<?php echo e(translate('messages.Customer_Wallet_Report')); ?>">
                                    <span class="tio-circle nav-indicator-icon"></span>
                                    <span
                                        class="text-truncate text-capitalize"><?php echo e(translate('messages.Customer_Wallet_Report')); ?></span>
                                </a>
                                </li>
                            </ul>
                        </li>
                    <?php endif; ?>
                    <!-- Report -->
                    <!-- Business Settings -->
                    <?php if(\App\CentralLogics\Helpers::module_permission_check('settings')): ?>
                        <li class="nav-item">
                            <small class="nav-subtitle"
                                title="<?php echo e(translate('messages.business_settings')); ?>"><?php echo e(translate('messages.business_settings')); ?></small>
                            <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                        </li>

                        <li
                            class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/business-settings/business-setup*')
                                ||  Request::is('admin/business-settings/refund/settings*') ||  Request::is('admin/business-settings/language*')
                            ? 'active' : ''); ?>">
                            <a class="nav-link " href="<?php echo e(route('admin.business-settings.business-setup')); ?>"
                                title="<?php echo e(translate('messages.business_setup')); ?>">
                                <span class="tio-settings nav-icon"></span>
                                <span class="text-truncate"><?php echo e(translate('messages.business_setup')); ?></span>
                            </a>
                        </li>
                        <!-- Subscription-->
                        <?php if(\App\CentralLogics\Helpers::subscription_check() == true &&  \App\CentralLogics\Helpers::module_permission_check('restaurant')  ): ?>

                            <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/subscription*') ? 'active' : ''); ?>">
                                <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                                    title="<?php echo e(translate('messages.subscription')); ?>">
                                    <i class="tio-crown  nav-icon"></i>
                                    <span
                                        class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.subscription_management')); ?></span>
                                </a>
                                <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                                    style="display: <?php echo e(Request::is('admin/subscription*') ? 'block' : 'none'); ?>">
                                    <li class="nav-item <?php echo e(Request::is('admin/subscription/package/*') || Request::is('admin/subscription/search')  ||  Request::is('admin/subscription/transcation/list/*')? 'active' : ''); ?>">
                                        <a class="nav-link " href="<?php echo e(route('admin.subscription.package_list')); ?>"
                                            title="<?php echo e(translate('messages.Package_list')); ?>">
                                            <span class="tio-circle nav-indicator-icon"></span>
                                            <span class="text-truncate"><?php echo e(translate('messages.subscription_Packages')); ?></span>
                                        </a>
                                    </li>
                                    <li class="nav-item <?php echo e(Request::is('admin/subscription/list') ? 'active' : ''); ?>">
                                        <a class="nav-link " href="<?php echo e(route('admin.subscription.subscription_list')); ?>"
                                            title="<?php echo e(translate('messages.subscription_list')); ?>">
                                            <span class="tio-circle nav-indicator-icon"></span>
                                            <span class="text-truncate"><?php echo e(translate('Subscriber_list')); ?></span>
                                        </a>
                                    </li>
                                    </li>
                                    <li class="nav-item <?php echo e(Request::is('admin/subscription/settings') ? 'active' : ''); ?>">
                                        <a class="nav-link " href="<?php echo e(route('admin.subscription.settings')); ?>"
                                            title="<?php echo e(translate('messages.settings')); ?>">
                                            <span class="tio-circle nav-indicator-icon"></span>
                                            <span class="text-truncate"><?php echo e(translate('messages.settings')); ?></span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        <?php endif; ?>
                        <!-- End Subscription -->

                        <!-- <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/business-settings/email-setup*') ? 'active' : ''); ?>">
                            <a class="nav-link " href="<?php echo e(route('admin.business-settings.email-setup',['admin','forgot-password'])); ?>" title="<?php echo e(translate('messages.email_template')); ?>">
                                <span class="tio-email nav-icon"></span>
                                <span class="text-truncate"><?php echo e(translate('messages.email_template')); ?></span>
                            </a>
                        </li> -->

                        <!-- <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/business-settings/theme-settings*') ? 'active' : ''); ?>">
                            <a class="nav-link " href="<?php echo e(route('admin.business-settings.theme-settings')); ?>"
                                title="<?php echo e(translate('messages.theme_settings')); ?>">
                                <span class="tio-brush nav-icon"></span>
                                <span class="text-truncate"><?php echo e(translate('messages.theme_settings')); ?></span>
                            </a>
                        </li> -->

                        <!-- <li
                            class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/file-manager*') ? 'active' : ''); ?>">
                            <a class="nav-link " href="<?php echo e(route('admin.file-manager.index')); ?>"
                                title="<?php echo e(translate('messages.gallery')); ?>">
                                <span class="tio-album nav-icon"></span>
                                <span
                                    class="text-truncate text-capitalize"><?php echo e(translate('messages.gallery')); ?></span>
                            </a>
                        </li> -->



                    <!-- web & adpp Settings -->
                        <li  class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/business-settings/pages*') || Request::is('admin/business-settings/social-media')  ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                                title="<?php echo e(translate('messages.Pages_&_Social_Media')); ?>">
                                <i class="tio-pages nav-icon"></i>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.Pages_&_Social_Media')); ?>

                                   </span>
                            </a>
                            <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                                style="display: <?php echo e(Request::is('admin/business-settings/pages*') || Request::is('admin/business-settings/social-media')  ? 'block' : 'none'); ?>">


                                    <li  class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/business-settings/social-media') ? 'active' : ''); ?>">
                                        <a class="nav-link " href="<?php echo e(route('admin.business-settings.social-media.index')); ?>"
                                            title="<?php echo e(translate('messages.Social_Media')); ?>">
                                            <span class="tio-circle nav-indicator-icon"></span>
                                            <span class="text-truncate"><?php echo e(translate('messages.Social_Media')); ?></span>
                                        </a>
                                    </li>

                                    <li class="nav-item <?php echo e(Request::is('admin/business-settings/pages/terms-and-conditions') ? 'active' : ''); ?>">
                                        <a class="nav-link "
                                            href="<?php echo e(route('admin.business-settings.terms-and-conditions')); ?>"
                                            title="<?php echo e(translate('messages.terms_and_condition')); ?>">
                                            <span class="tio-circle nav-indicator-icon"></span>
                                            <span
                                                class="text-truncate"><?php echo e(translate('messages.terms_and_condition')); ?></span>
                                        </a>
                                    </li>

                                    <li  class="nav-item <?php echo e(Request::is('admin/business-settings/pages/privacy-policy') ? 'active' : ''); ?>">
                                        <a class="nav-link "
                                            href="<?php echo e(route('admin.business-settings.privacy-policy')); ?>"
                                            title="<?php echo e(translate('messages.privacy_policy')); ?>">
                                            <span class="tio-circle nav-indicator-icon"></span>
                                            <span class="text-truncate"><?php echo e(translate('messages.privacy_policy')); ?></span>
                                        </a>
                                    </li>

                                    <li  class="nav-item <?php echo e(Request::is('admin/business-settings/pages/about-us') ? 'active' : ''); ?>">
                                        <a class="nav-link " href="<?php echo e(route('admin.business-settings.about-us')); ?>"
                                            title="<?php echo e(translate('messages.about_us')); ?>">
                                            <span class="tio-circle nav-indicator-icon"></span>
                                            <span class="text-truncate"><?php echo e(translate('messages.about_us')); ?></span>
                                        </a>
                                    </li>


                                    <li class="nav-item <?php echo e(Request::is('admin/business-settings/pages/refund-policy') ? 'active' : ''); ?>">
                                        <a class="nav-link "
                                            href="<?php echo e(route('admin.business-settings.refund-policy')); ?>"
                                            title="<?php echo e(translate('messages.refund_policy')); ?>">
                                            <span class="tio-circle nav-indicator-icon"></span>
                                            <span class="text-truncate"><?php echo e(translate('messages.refund_policy')); ?></span>
                                        </a>
                                    </li>


                                    <li class="nav-item <?php echo e(Request::is('admin/business-settings/pages/shipping-policy') ? 'active' : ''); ?>">
                                        <a class="nav-link "
                                            href="<?php echo e(route('admin.business-settings.shipping-policy')); ?>"
                                            title="<?php echo e(translate('messages.shipping_policy')); ?>">
                                            <span class="tio-circle nav-indicator-icon"></span>
                                            <span class="text-truncate"><?php echo e(translate('messages.shipping_policy')); ?></span>
                                        </a>
                                    </li>

                                    <li class="nav-item <?php echo e(Request::is('admin/business-settings/pages/cancellation-policy') ? 'active' : ''); ?>">
                                        <a class="nav-link "
                                            href="<?php echo e(route('admin.business-settings.cancellation-policy')); ?>"
                                            title="<?php echo e(translate('messages.cancellation_policy')); ?>">
                                            <span class="tio-circle nav-indicator-icon"></span>
                                            <span class="text-truncate"><?php echo e(translate('messages.cancellation_policy')); ?></span>
                                        </a>
                                    </li>


                            </ul>
                        </li>
                        <!-- <li class="nav-item">
                            <small class="nav-subtitle"
                                title="<?php echo e(translate('messages.system_settings')); ?>"><?php echo e(translate('messages.system_settings')); ?></small>
                            <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                        </li>

                        <li class="navbar-vertical-aside-has-menu   <?php echo e(Request::is('admin/business-settings/fcm-*')|| Request::is('admin/business-settings/payment-method')  || Request::is('admin/business-settings/sms-module')|| Request::is('admin/business-settings/mail-config') || Request::is('admin/social-login/view') || Request::is('admin/business-settings/offline*')||Request::is('admin/business-settings/config*')  || Request::is('admin/business-settings/recaptcha*') || Request::is('admin/business-settings/*') ? 'active' : ''); ?> <?php echo $__env->yieldContent('3rd_party'); ?>" >
                            <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                                title="<?php echo e(translate('3rd_Party_&_Configurations')); ?>">
                                <span class="tio-plugin nav-icon"></span>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.3rd_Party_&_Configurations')); ?></span>
                            </a>
                            <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                                style="display: <?php echo e(Request::is('admin/business-settings/deliveryman/join-us/*') || Request::is('admin/business-settings/restaurant/join-us/*') || Request::is('admin/business-settings/fcm-*')|| Request::is('admin/business-settings/payment-method')  || Request::is('admin/business-settings/sms-module')|| Request::is('admin/business-settings/mail-config') || Request::is('admin/social-login/view') ||Request::is('admin/business-settings/config*') || Request::is('admin/business-settings/recaptcha*') || Request::is('admin/business-settings/offline*') || Request::is('admin/login-url/login-page-setup*')? 'block' : 'none'); ?>  ">


                                <li class="nav-item <?php echo e(Request::is('admin/business-settings/payment-method') || Request::is('admin/business-settings/sms-module')|| Request::is('admin/business-settings/mail-config') || Request::is('admin/social-login/view') ||Request::is('admin/business-settings/config*') || Request::is('admin/business-settings/recaptcha*')  ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.business-settings.payment-method')); ?>"
                                        title="<?php echo e(translate('messages.3rd_Party')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate"><?php echo e(translate('messages.3rd_Party')); ?>

                                        </span>
                                    </a>
                                </li>

                                <li class="nav-item  <?php echo e(Request::is('admin/business-settings/fcm-*') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.business-settings.fcm-index')); ?>"
                                        title="<?php echo e(translate('messages.Firebase_Notification')); ?> ">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate"><?php echo e(translate('messages.Firebase_Notification')); ?>

                                        </span>
                                    </a>
                                </li>
                                <li class="nav-item  <?php echo e(Request::is('admin/login-url/login-page-setup*') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.login_url.login_url_page')); ?>"
                                        title="<?php echo e(translate('messages.login_page_setup')); ?> ">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate"><?php echo e(translate('messages.login_page_setup')); ?>

                                        </span>
                                    </a>
                                </li>
                                <?php if(\App\CentralLogics\Helpers::get_mail_status('offline_payment_status')): ?>
                                <li class="nav-item <?php echo e(Request::is('admin/business-settings/offline*') ? 'active' : ''); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.business-settings.offline')); ?>" title="<?php echo e(translate('messages.Offline_Payment_Setup')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate"><?php echo e(translate('messages.Offline_Payment_Setup')); ?></span>
                                    </a>
                                </li>
                                <?php endif; ?>

                                <li class="nav-item <?php echo $__env->yieldContent('reg_page'); ?>">
                                    <a class="nav-link " href="<?php echo e(route('admin.business-settings.restaurant_page_setup')); ?>" title="<?php echo e(translate('messages.Join_us_page_setup')); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate"><?php echo e(translate('messages.Join_us_page_setup')); ?></span>
                                    </a>
                                </li>


                            </ul>
                        </li> -->

                        <!-- <li
                            class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/business-settings/app-settings*') ? 'active' : ''); ?>">
                            <a class="nav-link " href="<?php echo e(route('admin.business-settings.app-settings')); ?>"
                                title="<?php echo e(translate('messages.App_&_Web_Settings')); ?>">
                                <span class="tio-android nav-icon"></span>
                                <span class="text-truncate"><?php echo e(translate('messages.App_&_Web_Settings')); ?></span>
                            </a>
                        </li> -->

                    <!-- <li class="navbar-vertical-aside-has-menu   <?php echo e(Request::is('admin/react-landing-page*') ||   Request::is('admin/landing-page*')  ? 'active' : ''); ?>">
                        <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:"
                            title="<?php echo e(translate('landing_page_settings')); ?>">
                            <span class="tio-files nav-icon"></span>
                            <span
                                class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.landing_page_settings')); ?></span>
                        </a>
                        <ul class="js-navbar-vertical-aside-submenu nav nav-sub"
                            style="display: <?php echo e(Request::is('admin/react-landing-page*') ||   Request::is('admin/landing-page*')  ? 'block' : 'none'); ?>">

                            <li class="nav-item <?php echo e(Request::is('admin/landing-page*') ? 'active' : ''); ?>">
                            <a class="nav-link"
                                href="<?php echo e(route('admin.landing_page.header')); ?>"
                                title="<?php echo e(translate('messages.Admin_landing_page')); ?> ">
                               <span class="tio-circle nav-indicator-icon"></span>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.Admin_landing_page')); ?></span>
                            </a>
                        </li>

                            <li class="nav-item <?php echo e(Request::is('admin/react-landing-page*') ? 'active' : ''); ?>">
                            <a class="nav-link"
                                href="<?php echo e(route('admin.react_landing_page.react_header')); ?>"
                                title="<?php echo e(translate('messages.React_landing_page')); ?> ">
                               <span class="tio-circle nav-indicator-icon"></span>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.React_landing_page')); ?></span>
                            </a>
                        </li>

                        </ul>
                    </li> -->
<!-- 
                        <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/business-settings/react*') ? 'active' : ''); ?>">
                            <a class="nav-link " href="<?php echo e(route('admin.business-settings.react-setup')); ?>"
                                title="<?php echo e(translate('messages.react_site')); ?>">
                                <span class="tio-rear-window-defrost nav-icon"></span>
                                <span class="text-truncate"><?php echo e(translate('messages.react_site')); ?></span>
                            </a>
                        </li> -->


                        <!-- <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/business-settings/db-index') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link"
                                href="<?php echo e(route('admin.business-settings.db-index')); ?>"
                                title="<?php echo e(translate('messages.clean_database')); ?>">
                                <i class="tio-cloud nav-icon"></i>
                                <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                                    <?php echo e(translate('messages.clean_database')); ?>

                                </span>
                            </a>
                        </li> -->

                    <!-- End web & adpp Settings -->

                    <?php endif; ?>
                    <!-- End Business Settings -->


                    <!-- Business Section-->
                    <li class="nav-item">
                        <small class="nav-subtitle"
                            title="<?php echo e(translate('messages.business_section')); ?>"><?php echo e(translate('messages.transaction_management')); ?></small>
                        <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                    </li>
                    <!-- account -->
                    <?php if(\App\CentralLogics\Helpers::module_permission_check('account')): ?>
                        <li
                            class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/restaurant-disbursement*') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link"
                               href="<?php echo e(route('admin.restaurant-disbursement.list', ['status' => 'all'])); ?>"
                               title="<?php echo e(translate('messages.restaurant_disbursement')); ?>">
                                <i class="tio-wallet-outlined nav-icon"></i>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.restaurant_disbursement')); ?></span>
                            </a>
                        </li>
                    <?php endif; ?>
                <?php if(\App\CentralLogics\Helpers::module_permission_check('account')): ?>
                    <li
                        class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/dm-disbursement*') ? 'active' : ''); ?>">
                        <a class="js-navbar-vertical-aside-menu-link nav-link"
                           href="<?php echo e(route('admin.dm-disbursement.list', ['status' => 'all'])); ?>"
                           title="<?php echo e(translate('messages.dm_disbursement')); ?>">
                            <i class="tio-saving-outlined nav-icon"></i>
                            <span
                                class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.delivery_man_disbursement')); ?></span>
                        </a>
                    </li>
                <?php endif; ?>
                    <?php if(\App\CentralLogics\Helpers::module_permission_check('account')): ?>
                        <li
                            class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/account-transaction*') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link"
                                href="<?php echo e(route('admin.account-transaction.index')); ?>"
                                title="<?php echo e(translate('messages.collect_cash')); ?>">
                                <i class="tio-money nav-icon"></i>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.collect_cash')); ?></span>
                            </a>
                        </li>
                    <?php endif; ?>
                    <!-- End account -->
                    <!-- withdraw -->
                    <?php if(\App\CentralLogics\Helpers::module_permission_check('withdraw_list')): ?>
                        <li
                            class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/restaurant/withdraw*') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link"
                                href="<?php echo e(route('admin.restaurant.withdraw_list')); ?>"
                                title="<?php echo e(translate('messages.restaurant_withdraws')); ?>">
                                <i class="tio-table nav-icon"></i>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.restaurant_withdraws')); ?></span>
                            </a>
                        </li>
                    <?php endif; ?>

                    <?php if(\App\CentralLogics\Helpers::module_permission_check('settings')): ?>
                        <li
                        class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/business-settings/withdraw-method*') ? 'active' : ''); ?>">
                        <a class="js-navbar-vertical-aside-menu-link nav-link"
                            href="<?php echo e(route('admin.business-settings.withdraw-method.list')); ?>"
                            title="<?php echo e(translate('messages.withdraw_method')); ?>">
                            <i class="tio-savings nav-icon"></i>
                            <span
                                class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.withdraw_method')); ?></span>
                        </a>
                        </li>
                    <?php endif; ?>
                    <!-- End withdraw -->

                    <!-- provide_dm_earning -->
                    <?php if(\App\CentralLogics\Helpers::module_permission_check('provide_dm_earning')): ?>
                        <li
                            class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/provide-deliveryman-earnings*') ? 'active' : ''); ?>">
                            <a class="js-navbar-vertical-aside-menu-link nav-link"
                                href="<?php echo e(route('admin.provide-deliveryman-earnings.index')); ?>"
                                title="<?php echo e(translate('messages.DeliveryMan_Payments')); ?>">
                                <i class="tio-send nav-icon"></i>
                                <span
                                    class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('messages.DeliveryMan_Payments')); ?></span>
                            </a>
                        </li>
                    <?php endif; ?>
                    <!-- End provide_dm_earning -->



                    
                    <!-- Dashboards -->
                    <!-- <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/business-settings/system-addon')?'show active':''); ?>">
                        <a class="js-navbar-vertical-aside-menu-link nav-link"
                           href="<?php echo e(route('admin.business-settings.system-addon.index')); ?>" title="<?php echo e(translate('messages.system_addons')); ?>">
                            <i class="tio-add-circle-outlined nav-icon"></i>
                            <span class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate">
                            <?php echo e(translate('messages.system_addons')); ?>

                        </span>
                        </a>
                    </li> -->
                    <!-- End Dashboards -->
                    

                
                





                <?php if(count(config('addon_admin_routes'))>0): ?>
                <li class="nav-item">
                    <small
                        class="nav-subtitle"><?php echo e(translate('messages.addon_menus')); ?></small>
                    <small class="tio-more-horizontal nav-subtitle-replacer"></small>
                </li>
                <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is('admin/payment/configuration/*') || Request::is('admin/sms/configuration/*')?'active':''); ?>">
                    <a class="js-navbar-vertical-aside-menu-link nav-link nav-link-toggle" href="javascript:" >
                        <i class="tio-puzzle nav-icon"></i>
                        <span  class="navbar-vertical-aside-mini-mode-hidden-elements text-truncate"><?php echo e(translate('Addon Menus')); ?></span>
                    </a>
                    <ul class="js-navbar-vertical-aside-submenu nav nav-sub" style="display: <?php echo e(Request::is('admin/payment/configuration/*') || Request::is('admin/sms/configuration/*')?'block':'none'); ?>">
                        <?php $__currentLoopData = config('addon_admin_routes'); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $routes): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php $__currentLoopData = $routes; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $route): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <li class="navbar-vertical-aside-has-menu <?php echo e(Request::is($route['path'])  ? 'active' :''); ?>">
                                    <a class="js-navbar-vertical-aside-menu-link nav-link "
                                    href="<?php echo e($route['url']); ?>" title="<?php echo e(translate($route['name'])); ?>">
                                        <span class="tio-circle nav-indicator-icon"></span>
                                        <span class="text-truncate"><?php echo e(translate($route['name'])); ?></span>
                                    </a>
                                </li>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </ul>
                </li>
            <?php endif; ?>
            <!--addon end-->




                    <!-- End web & adpp Settings -->



                    <li class="nav-item pt-100px">

                    </li>
                </ul>
            </div>
            <!-- End Content -->
        </div>
    </aside>
</div>

<div id="sidebarCompact" class="d-none">

</div>


<?php $__env->startPush('script_2'); ?>
    <script>
        $(window).on('load', function() {
            if ($(".navbar-vertical-content li.active").length) {
                $('.navbar-vertical-content').animate({
                    scrollTop: $(".navbar-vertical-content li.active").offset().top - 150
                }, 10);
            }
        });
    </script>
    <script>
        var $rows = $('#navbar-vertical-content li');
        $('#search').keyup(function() {
            var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

            $rows.show().filter(function() {
                var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                return !~text.indexOf(val);
            }).hide();
        });
    </script>
<?php $__env->stopPush(); ?>
<?php /**PATH C:\xampp\htdocs\halaltogo\resources\views/layouts/admin/partials/_sidebar.blade.php ENDPATH**/ ?>