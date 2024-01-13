
<div class="__bg-F8F9FC-card view_new_option mb-2">
    <div class="d-flex align-items-center justify-content-between mb-3">
    <label class="form-check form--check" >
        <input name="options[<?php echo e($key); ?>][required]" type="checkbox" class="form-check-input"
                                    <?php echo e(isset($item['required']) ? ($item['required'] == 'on' ? 'checked	' : '') : ''); ?>>
        <span class="form-check-label"><?php echo e(translate('Required')); ?></span>
    </label>
    <div>
        <button type="button" class="btn btn-danger btn-sm delete_input_button" onclick="removeOption(this)"
            title="<?php echo e(translate('Delete')); ?>">
            <i class="tio-add-to-trash"></i>
        </button>
    </div>
    </div>
    <div class="row g-2">
        <div class="col-xl-4 col-lg-6">
            <label for=""><?php echo e(translate('Vatiation_Title')); ?></label>
            <input required name="options[<?php echo e($key); ?>][name]" required class="form-control"
            type="text" onkeyup="new_option_name(this.value,<?php echo e($key); ?>)"
            value="<?php echo e($item['name']); ?>">
        </div>

        <div class="col-xl-4 col-lg-6">
            <div>
                <label class="input-label text-capitalize d-flex alig-items-center"><span class="line--limit-1"><?php echo e(translate('Variation_Selection_Type')); ?> </span>
                </label>
                <div class="resturant-type-group px-0">
                    <label class="form-check form--check mr-2 mr-md-4">
                        <input class="form-check-input" type="radio" value="multi"
                        name="options[<?php echo e($key); ?>][type]" id="type<?php echo e($key); ?>"
                        <?php echo e($item['type'] == 'multi' ? 'checked' : ''); ?>

                        onchange="show_min_max(<?php echo e($key); ?>)">
                        <span class="form-check-label">
                            <?php echo e(translate('Multiple_Selection')); ?>

                        </span>
                    </label>

                    <label class="form-check form--check mr-2 mr-md-4">
                        <input class="form-check-input" type="radio" value="single"
                        <?php echo e($item['type'] == 'single' ? 'checked' : ''); ?> name="options[<?php echo e($key); ?>][type]"
                        id="type<?php echo e($key); ?>" onchange="hide_min_max(<?php echo e($key); ?>)">
                        <span class="form-check-label">
                            <?php echo e(translate('Single_Selection')); ?>

                        </span>
                    </label>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-lg-6">
            <div class="row g-2">
                <div class="col-6">
                    <label for=""><?php echo e(translate('Min_Option_to_Select')); ?></label>
                    <input id="min_max1_<?php echo e($key); ?>" <?php echo e($item['type'] == 'single' ? 'readonly ' : 'required'); ?>

                    value="<?php echo e(($item['min'] != 0) ? $item['min']:''); ?>" name="options[<?php echo e($key); ?>][min]"
                    class="form-control" type="number" min="1">                </div>
                <div class="col-6">
                    <label for=""><?php echo e(translate('Max_Option_to_Select')); ?></label>
                    <input id="min_max2_<?php echo e($key); ?>" <?php echo e($item['type'] == 'single' ? 'readonly ' : 'required'); ?>

                    value="<?php echo e(($item['max'] != 0) ? $item['max']:''); ?>" name="options[<?php echo e($key); ?>][max]"
                    class="form-control" type="number" min="2">                </div>
            </div>
        </div>
    </div>

    <div id="option_price_<?php echo e($key); ?>">
        <div class="border bg-white rounded p-3 pb-0 mt-3">
            <div id="option_price_view_<?php echo e($key); ?>">



                <?php if(isset($item['values'])): ?>
                    <?php $__currentLoopData = $item['values']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key_value => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>


                <div class="row g-3 add_new_view_row_class mb-2">
                    <div class="col-lg-4 col-sm-6">
                        <label for=""><?php echo e(translate('Option_name')); ?></label>
                        <input class="form-control" required type="text"
                        name="options[<?php echo e($key); ?>][values][<?php echo e($key_value); ?>][label]"
                        value="<?php echo e($value['label']); ?>">
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <label for=""><?php echo e(translate('Additional_price')); ?></label>
                        <input class="form-control" required type="number" min="0" step="0.01"
                        name="options[<?php echo e($key); ?>][values][<?php echo e($key_value); ?>][optionPrice]"
                        value="<?php echo e($value['optionPrice']); ?>">
                    </div>
                    <div class="col-sm-2 max-sm-absolute">
                        <label class="d-none d-md-block">&nbsp;</label>
                        <div class="mt-1">
                            <button type="button" class="btn btn-danger btn-sm" onclick="deleteRow(this)"
                                title="<?php echo e(translate('Delete')); ?>">
                                <i class="tio-add-to-trash"></i>
                            </button>
                        </div>
                    </div>
                </div>

                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                <?php endif; ?>
            </div>

            <div class="row p-3 mr-1 d-flex " id="add_new_button_<?php echo e($key); ?>">
                <button type="button" class="btn btn--primary btn-outline-primary" onclick="add_new_row_button(<?php echo e($key); ?>)" ><?php echo e(translate('Add_New_Option')); ?></button>
            </div>
        </div>
    </div>
</div>



<?php /**PATH C:\xampp\htdocs\halaltogo\resources\views/admin-views/product/partials/_new_variations.blade.php ENDPATH**/ ?>