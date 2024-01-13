<!-- Header -->
<div class="card-header">
    <h5 class="card-header-title">
        <img src="<?php echo e(asset('/public/assets/admin/img/dashboard/most-popular.png')); ?>" alt="dashboard"
            class="card-header-icon">
        <?php echo e(translate('Most_Popular_Restaurants')); ?>

    </h5>
    <?php ($params = session('dash_params')); ?>
    <?php if($params['zone_id'] != 'all'): ?>
        <?php ($zone_name = \App\Models\Zone::where('id', $params['zone_id'])->first()->name); ?>
    <?php else: ?>
        <?php ($zone_name = translate('All')); ?>
    <?php endif; ?>
    <span class="badge badge-soft--info my-2"><?php echo e(translate('messages.zone')); ?> : <?php echo e($zone_name); ?></span>
</div>
<!-- End Header -->

<!-- Body -->
<div class="card-body">
    <ul class="most-popular">
        <?php $__currentLoopData = $popular; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <li onclick="location.href='<?php echo e(route('admin.restaurant.view', $item->restaurant_id)); ?>'" class="cursor-pointer">
                <div class="img-container">
                    <img onerror="this.src='<?php echo e(asset('public/assets/admin/img/100x100/1.png')); ?>'"
                        src="<?php echo e(asset('storage/app/public/restaurant')); ?>/<?php echo e($item->restaurant['logo']); ?>">
                    <span class="ml-2">
                        <?php echo e(Str::limit($item->restaurant->name ?? translate('messages.Restaurant_deleted!'), 20, '...')); ?> </span>
                </div>
                <span class="count">
                    <?php echo e($item['count']); ?> <i class="tio-heart"></i>
                </span>
            </li>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </ul>
</div>
<?php /**PATH C:\xampp\htdocs\halaltogo\resources\views/admin-views/partials/_popular-restaurants.blade.php ENDPATH**/ ?>