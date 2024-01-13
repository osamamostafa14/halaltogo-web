<div class="col-sm-6 col-lg-3">
    <!-- Card -->
    <a class="order--card h-100" href="<?php echo e(route('admin.dispatch.list',['searching_for_deliverymen'])); ?>">
        <div class="d-flex justify-content-between align-items-center">
            <h6 class="card-subtitle d-flex justify-content-between m-0 align-items-center">
                <img src="<?php echo e(asset('/public/assets/admin/img/dashboard/5.png')); ?>" alt="dashboard" class="oder--card-icon">
                <span><?php echo e(translate('unassigned_orders')); ?></span>
            </h6>
            <span class="card-title text-info">
                <?php echo e($data['searching_for_dm']); ?>

            </span>
        </div>
    </a>
    <!-- End Card -->
</div>

<div class="col-sm-6 col-lg-3">
    <!-- Card -->
    <a class="order--card h-100" href="<?php echo e(route('admin.dispatch.list',['accepted'])); ?>">
        <div class="d-flex justify-content-between align-items-center">
            <h6 class="card-subtitle d-flex justify-content-between m-0 align-items-center">
                <img src="<?php echo e(asset('/public/assets/admin/img/dashboard/6.png')); ?>" alt="dashboard" class="oder--card-icon">
                <span><?php echo e(translate('accepted_by_delivery_man')); ?></span>
            </h6>
            <span class="card-title text-success">
                <?php echo e($data['accepted_by_dm']); ?>

            </span>
        </div>
    </a>
    <!-- End Card -->
</div>

<div class="col-sm-6 col-lg-3">
    <!-- Card -->
    <a class="order--card h-100" href="<?php echo e(route('admin.dispatch.list',['accepted'])); ?>">
        <div class="d-flex justify-content-between align-items-center">
            <h6 class="card-subtitle d-flex justify-content-between m-0 align-items-center">
                <img src="<?php echo e(asset('/public/assets/admin/img/dashboard/7.png')); ?>" alt="dashboard" class="oder--card-icon">
                <span><?php echo e(translate('cooking_in_restaurant')); ?></span>
            </h6>
            <span class="card-title text-danger">
                <?php echo e($data['preparing_in_rs']); ?>

            </span>
        </div>
    </a>
    <!-- End Card -->
</div>

<div class="col-sm-6 col-lg-3">
    <!-- Card -->
    <a class="order--card h-100" href="<?php echo e(route('admin.dispatch.list',['accepted'])); ?>">
        <div class="d-flex justify-content-between align-items-center">
            <h6 class="card-subtitle d-flex justify-content-between m-0 align-items-center">
                <img src="<?php echo e(asset('/public/assets/admin/img/dashboard/8.png')); ?>" alt="dashboard" class="oder--card-icon">
                <span><?php echo e(translate('picked_up_by_delivery_man')); ?></span>
            </h6>
            <span class="card-title text-success">
                <?php echo e($data['picked_up']); ?>

            </span>
        </div>
    </a>
    <!-- End Card -->
</div><?php /**PATH C:\xampp\htdocs\halaltogo\resources\views/admin-views/partials/_dashboard-order-stats.blade.php ENDPATH**/ ?>