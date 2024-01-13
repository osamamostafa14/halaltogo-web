<!-- Header -->
<div class="card-header">
    <h5 class="card-header-title">
        <img src="<?php echo e(asset('/public/assets/admin/img/dashboard/top-selling.png')); ?>" alt="dashboard" class="card-header-icon">
        <span><?php echo e(translate('messages.top_selling_foods')); ?></span>
    </h5>
    <?php ($params=session('dash_params')); ?>
    <?php if($params['zone_id']!='all'): ?>
        <?php ($zone_name=\App\Models\Zone::where('id',$params['zone_id'])->first()->name); ?>
    <?php else: ?>
    <?php ($zone_name=translate('All')); ?>
    <?php endif; ?>
    <span class="badge badge-soft--info my-2"><?php echo e(translate('messages.zone')); ?> : <?php echo e($zone_name); ?></span>
</div>
<!-- End Header -->

<!-- Body -->
<div class="card-body">
    <div class="row g-2">
        <?php $__currentLoopData = $top_sell; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <div class="col-md-4 col-sm-6">
                <div class="grid-card top-selling-food-card pt-0" onclick="location.href='<?php echo e(route('admin.food.view',[$item['id']])); ?>'">
                    <div class="position-relative">
                        <span class="sold--count-badge"><span><?php echo e(translate('messages.sold')); ?></span> <span>:</span> <span><?php echo e($item['order_count']); ?></span></span>
                        <img class="initial-43"
                            src="<?php echo e(asset('storage/app/public/product')); ?>/<?php echo e($item['image']); ?>"
                            onerror="this.src='<?php echo e(asset('public/assets/admin/img/100x100/food.png')); ?>'"
                            alt="<?php echo e($item->name); ?> image">
                    </div>
                    <div class="text-center mt-2">
                        <span><?php echo e(Str::limit($item['name'],20,'...')); ?></span>
                    </div>
                </div>
            </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </div>
</div>
<!-- End Body -->
<?php /**PATH C:\xampp\htdocs\halaltogo\resources\views/admin-views/partials/_top-selling-foods.blade.php ENDPATH**/ ?>