<!-- Header -->
<div class="card-header">
    <h5 class="card-header-title">
        <img src="<?php echo e(asset('/public/assets/admin/img/dashboard/top-deliveryman.png')); ?>" alt="dashboard" class="card-header-icon">
        <span><?php echo e(translate('Top_Deliveryman')); ?></span>
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
        <?php $__currentLoopData = $top_deliveryman; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <div class="col-md-4 col-6" onclick="location.href='<?php echo e(route('admin.delivery-man.preview',[$item['id']])); ?>'">
                <div class="grid-card top--deliveryman">
                    <center>
                        <img class="initial-41" onerror="this.src='<?php echo e(asset('public/assets/admin/img/160x160/img1.jpg')); ?>'"
                        src="<?php echo e(asset('storage/app/public/delivery-man')); ?>/<?php echo e($item['image']??''); ?>">
                    </center>
                    <div class="text-center mt-2">
                        <h5 class="name m-0"><?php echo e($item['f_name'] ?? translate('messages.Not_exist')); ?></h5>
                        <h5 class="info m-0 mt-1"><span class="text-warning"><?php echo e($item['order_count']); ?></span> <?php echo e(translate('Orders')); ?></h5>
                    </div>
                </div>
            </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </div>
</div>
<!-- End Body -->
<?php /**PATH C:\xampp\htdocs\halaltogo\resources\views/admin-views/partials/_top-deliveryman.blade.php ENDPATH**/ ?>