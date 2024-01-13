<?php $__env->startSection('title', translate('Food_List')); ?>

<?php $__env->startPush('css_or_js'); ?>
    <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>

    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-md-auto mb-md-0 mb-3 mr-auto">
                    <h1 class="page-header-title"> <?php echo e(translate('messages.food_list')); ?><span
                            class="badge badge-soft-dark ml-2" id="foodCount"><?php echo e($foods->total()); ?></span></h1>
                </div>
                <?php if($toggle_veg_non_veg): ?>
                    <!-- Veg/NonVeg filter -->
                    <div class="col-md-auto mb-3 mb-md-0">
                        <select name="category_id" onchange="set_filter('<?php echo e(url()->full()); ?>',this.value, 'type')"
                            data-placeholder="<?php echo e(translate('messages.all')); ?>" class="form-control">
                            <option value="all" <?php echo e($type == 'all' ? 'selected' : ''); ?>><?php echo e(translate('messages.all')); ?></option>
                            <option value="veg" <?php echo e($type == 'veg' ? 'selected' : ''); ?>><?php echo e(translate('messages.veg')); ?></option>
                            <option value="non_veg" <?php echo e($type == 'non_veg' ? 'selected' : ''); ?>><?php echo e(translate('messages.non_veg')); ?>

                            </option>
                        </select>
                    </div>
                    <!-- End Veg/NonVeg filter -->
                <?php endif; ?>
                <div class="col-md-auto mb-3 mb-md-0 min-240">
                    <select name="restaurant_id" id="restaurant"
                        onchange="set_restaurant_filter('<?php echo e(url()->full()); ?>',this.value)"
                        data-placeholder="<?php echo e(translate('messages.select_restaurant')); ?>"
                        class="js-data-example-ajax form-control"
                        onchange="getRestaurantData('<?php echo e(url('/')); ?>/admin/restaurant/get-addons?data[]=0&restaurant_id=',this.value,'add_on')"
                        required title="Select Restaurant"
                        oninvalid="this.setCustomValidity('<?php echo e(translate('messages.please_select_restaurant')); ?>')">
                        <?php if($restaurant): ?>
                            <option value="<?php echo e($restaurant->id); ?>" selected><?php echo e($restaurant->name); ?></option>
                        <?php else: ?>
                            <option value="all" selected><?php echo e(translate('messages.all_restaurants')); ?></option>
                        <?php endif; ?>
                    </select>
                </div>
                <div class="col-md-auto mb-3 mb-md-0 min-240">
                    <!-- Unfold -->
                    <div class="hs-unfold w-100">
                        <select name="category_id" id="category"
                            onchange="set_filter('<?php echo e(url()->full()); ?>',this.value, 'category_id')"
                            data-placeholder="<?php echo e(translate('messages.select_category')); ?>"
                            class="js-data-example-ajax form-control">
                            <?php if($category): ?>
                                <option value="<?php echo e($category->id); ?>" selected><?php echo e($category->name); ?>

                                    (<?php echo e($category->position == 0 ? translate('messages.main') : translate('messages.sub')); ?>)
                                </option>
                            <?php else: ?>
                                <option value="all" selected><?php echo e(translate('messages.all_categories')); ?></option>
                            <?php endif; ?>
                        </select>
                    </div>
                </div>
                <!-- End Unfold -->
            </div>

        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <!-- Card -->
                <div class="card">
                    <!-- Header -->
                    <div class="card-header border-0 py-2">
                        <div class="search--button-wrapper">
                            <h5 class="card-title d-none d-xl-block"></h5>
                            <form id="search-form">


                                <div class="input--group input-group input-group-merge input-group-flush">
                                    <input id="datatableSearch" name="search" type="search" value="<?php echo e(request()?->search ?? null); ?>" class="form-control"
                                        placeholder="<?php echo e(translate('Search_by_name')); ?>"
                                        aria-label="<?php echo e(translate('messages.search_here')); ?>">
                                    <button type="submit" class="btn btn--secondary">
                                        <i class="tio-search"></i>
                                    </button>
                                </div>
                                <!-- End Search -->
                            </form>

                            <div class="hs-unfold mr-2">
                                <a class="js-hs-unfold-invoker btn btn-sm btn-white dropdown-toggle min-height-40" href="javascript:;"
                                    data-hs-unfold-options='{
                                            "target": "#usersExportDropdown",
                                            "type": "css-animation"
                                        }'>
                                    <i class="tio-download-to mr-1"></i> <?php echo e(translate('messages.export')); ?>

                                </a>

                                <div id="usersExportDropdown"
                                    class="hs-unfold-content dropdown-unfold dropdown-menu dropdown-menu-sm-right">

                                    <span class="dropdown-header"><?php echo e(translate('messages.download_options')); ?></span>
                                    <a id="export-excel" class="dropdown-item" href="<?php echo e(route('admin.food.export', ['type' => 'excel', request()->getQueryString()])); ?>">
                                        <img class="avatar avatar-xss avatar-4by3 mr-2"
                                            src="<?php echo e(asset('public/assets/admin')); ?>/svg/components/excel.svg"
                                            alt="Image Description">
                                        <?php echo e(translate('messages.excel')); ?>

                                    </a>
                                    <a id="export-csv" class="dropdown-item" href="<?php echo e(route('admin.food.export', ['type' => 'csv', request()->getQueryString()])); ?>">
                                        <img class="avatar avatar-xss avatar-4by3 mr-2"
                                            src="<?php echo e(asset('public/assets/admin')); ?>/svg/components/placeholder-csv-format.svg"
                                            alt="Image Description">
                                        .<?php echo e(translate('messages.csv')); ?>

                                    </a>

                                </div>
                            </div>
                            <!-- Unfold -->
                            <!-- Unfold -->
                            <div class="hs-unfold m-2 ml-lg-3">
                                <a class="js-hs-unfold-invoker btn btn-white" href="javascript:;"
                                    data-hs-unfold-options='{
                                        "target": "#showHideDropdown",
                                        "type": "css-animation"
                                        }'>
                                    <i class="tio-table mr-1"></i> <?php echo e(translate('messages.columns')); ?>

                                </a>

                                <div id="showHideDropdown"
                                    class="hs-unfold-content dropdown-unfold dropdown-menu dropdown-menu-right dropdown-card">
                                    <div class="card card-sm">
                                        <div class="card-body">
                                            
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <span class="mr-2"><?php echo e(translate('messages.name')); ?></span>
                                                <!-- Checkbox Switch -->
                                                <label class="toggle-switch toggle-switch-sm" for="toggleColumn_name">
                                                    <input type="checkbox" class="toggle-switch-input"
                                                        id="toggleColumn_name" checked>
                                                    <span class="toggle-switch-label">
                                                        <span class="toggle-switch-indicator"></span>
                                                    </span>
                                                </label>
                                                <!-- End Checkbox Switch -->
                                            </div>

                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <span class="mr-2"><?php echo e(translate('messages.category')); ?></span>

                                                <!-- Checkbox Switch -->
                                                <label class="toggle-switch toggle-switch-sm" for="toggleColumn_type">
                                                    <input type="checkbox" class="toggle-switch-input"
                                                        id="toggleColumn_type" checked>
                                                    <span class="toggle-switch-label">
                                                        <span class="toggle-switch-indicator"></span>
                                                    </span>
                                                </label>
                                                <!-- End Checkbox Switch -->
                                            </div>

                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <span class="mr-2"><?php echo e(translate('messages.restaurant')); ?></span>

                                                <!-- Checkbox Switch -->
                                                <label class="toggle-switch toggle-switch-sm" for="toggleColumn_vendor">
                                                    <input type="checkbox" class="toggle-switch-input"
                                                        id="toggleColumn_vendor" checked>
                                                    <span class="toggle-switch-label">
                                                        <span class="toggle-switch-indicator"></span>
                                                    </span>
                                                </label>
                                                <!-- End Checkbox Switch -->
                                            </div>


                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <span class="mr-2"><?php echo e(translate('messages.status')); ?></span>

                                                <!-- Checkbox Switch -->
                                                <label class="toggle-switch toggle-switch-sm" for="toggleColumn_status">
                                                    <input type="checkbox" class="toggle-switch-input"
                                                        id="toggleColumn_status" checked>
                                                    <span class="toggle-switch-label">
                                                        <span class="toggle-switch-indicator"></span>
                                                    </span>
                                                </label>
                                                <!-- End Checkbox Switch -->
                                            </div>
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <span class="mr-2"><?php echo e(translate('messages.price')); ?></span>

                                                <!-- Checkbox Switch -->
                                                <label class="toggle-switch toggle-switch-sm" for="toggleColumn_price">
                                                    <input type="checkbox" class="toggle-switch-input"
                                                        id="toggleColumn_price" checked>
                                                    <span class="toggle-switch-label">
                                                        <span class="toggle-switch-indicator"></span>
                                                    </span>
                                                </label>
                                                <!-- End Checkbox Switch -->
                                            </div>
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <span class="mr-2"><?php echo e(translate('messages.action')); ?></span>

                                                <!-- Checkbox Switch -->
                                                <label class="toggle-switch toggle-switch-sm" for="toggleColumn_action">
                                                    <input type="checkbox" class="toggle-switch-input"
                                                        id="toggleColumn_action" checked>
                                                    <span class="toggle-switch-label">
                                                        <span class="toggle-switch-indicator"></span>
                                                    </span>
                                                </label>
                                                <!-- End Checkbox Switch -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Unfold -->
                        </div>
                        <!-- End Row -->
                    </div>
                    <!-- End Header -->

                    <!-- Table -->
                    <div class="table-responsive datatable-custom" id="table-div">
                        <table id="datatable"
                            class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                            data-hs-datatables-options='{
                                    "columnDefs": [{
                                        "targets": [],
                                        "width": "5%",
                                        "orderable": false
                                    }],
                                    "order": [],
                                    "info": {
                                    "totalQty": "#datatableWithPaginationInfoTotalQty"
                                    },

                                    "entries": "#datatableEntries",

                                    "isResponsive": false,
                                    "isShowPaging": false,
                                    "paging":false
                                }'>
                            <thead class="thead-light">
                                <tr>
                                    <th class="w-60px"><?php echo e(translate('messages.sl')); ?></th>
                                    <th class="w-100px"><?php echo e(translate('messages.name')); ?></th>
                                    <th class="w-120px"><?php echo e(translate('messages.category')); ?></th>
                                    <th class="w-120px"><?php echo e(translate('messages.restaurant')); ?></th>
                                    <th class="w-100px"><?php echo e(translate('messages.price')); ?></th>
                                    <th class="w-100px"><?php echo e(translate('messages.status')); ?></th>
                                    <th class="w-120px text-center">
                                        <?php echo e(translate('messages.action')); ?>

                                    </th>
                                </tr>
                            </thead>

                            <tbody id="set-rows">
                                <?php $__currentLoopData = $foods; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $food): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr>
                                        <td><?php echo e($key + $foods->firstItem()); ?></td>
                                        <td>
                                            <a class="media align-items-center"
                                                href="<?php echo e(route('admin.food.view', [$food['id']])); ?>">
                                                <img class="avatar avatar-lg mr-3"
                                                    src="<?php echo e(asset('storage/app/public/product')); ?>/<?php echo e($food['image']); ?>"
                                                    onerror="this.src='<?php echo e(asset('public/assets/admin/img/100x100/food-default-image.png')); ?>'"
                                                    alt="<?php echo e($food->name); ?> image">
                                                <div class="media-body">
                                                    <h5 class="text-hover-primary mb-0">
                                                        <?php echo e(Str::limit($food['name'], 20, '...')); ?></h5>
                                                </div>
                                            </a>
                                        </td>
                                        <td>
                                            <?php echo e(Str::limit(($food?->category?->parent ? $food?->category?->parent?->name : $food?->category?->name )  ?? translate('messages.uncategorize')
                                            , 20, '...')); ?>

                                        </td>
                                        <td>
                                            <?php if($food->restaurant): ?>
                                                <a class="text--title" href="<?php echo e(route('admin.restaurant.view',['restaurant'=>$food->restaurant_id])); ?>" title="<?php echo e(translate('view_restaurant')); ?>">
                                                    <?php echo e(Str::limit($food->restaurant->name, 20, '...')); ?>

                                                </a>
                                            <?php else: ?>
                                                <span class="text--danger text-capitalize"><?php echo e(Str::limit( translate('messages.Restaurant_deleted!'), 20, '...')); ?><span>
                                            <?php endif; ?>
                                        </td>
                                        <td><?php echo e(\App\CentralLogics\Helpers::format_currency($food['price'])); ?></td>
                                        <td>
                                            <label class="toggle-switch toggle-switch-sm"
                                                for="stocksCheckbox<?php echo e($food->id); ?>">
                                                <input type="checkbox"
                                                    onclick="location.href='<?php echo e(route('admin.food.status', [$food['id'], $food->status ? 0 : 1])); ?>'"
                                                    class="toggle-switch-input" id="stocksCheckbox<?php echo e($food->id); ?>"
                                                    <?php echo e($food->status ? 'checked' : ''); ?>>
                                                <span class="toggle-switch-label">
                                                    <span class="toggle-switch-indicator"></span>
                                                </span>
                                            </label>
                                        </td>
                                        <td>
                                            <div class="btn--container justify-content-center">
                                                <a class="btn btn-sm btn--primary btn-outline-primary action-btn"
                                                    href="<?php echo e(route('admin.food.edit', [$food['id']])); ?>"
                                                    title="<?php echo e(translate('messages.edit_food')); ?>"><i
                                                        class="tio-edit"></i>
                                                </a>
                                                <a class="btn btn-sm btn--warning btn-outline-warning action-btn" href="javascript:"
                                                    onclick="form_alert('food-<?php echo e($food['id']); ?>','<?php echo e(translate('messages.Want_to_delete_this_item')); ?>')"
                                                    title="<?php echo e(translate('messages.delete_food')); ?>"><i
                                                        class="tio-delete-outlined"></i>
                                                </a>
                                            </div>
                                            <form action="<?php echo e(route('admin.food.delete', [$food['id']])); ?>" method="post"
                                                id="food-<?php echo e($food['id']); ?>">
                                                <?php echo csrf_field(); ?> <?php echo method_field('delete'); ?>
                                            </form>
                                        </td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </tbody>
                        </table>
                    </div>
                    <?php if(count($foods) === 0): ?>
                    <div class="empty--data">
                        <img src="<?php echo e(asset('/public/assets/admin/img/empty.png')); ?>" alt="public">
                        <h5>
                            <?php echo e(translate('no_data_found')); ?>

                        </h5>
                    </div>
                    <?php endif; ?>
                    <div class="page-area px-4 pb-3">
                        <div class="d-flex align-items-center justify-content-end">
                                                
                            <div>
                                <?php echo $foods->withQueryString()->links(); ?>

                            </div>
                        </div>
                    </div>
                    <!-- End Table -->
                </div>
                <!-- End Card -->
            </div>
        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startPush('script_2'); ?>
    <script>
        $(document).on('ready', function() {
            // INITIALIZATION OF DATATABLES
            // =======================================================
            var datatable = $.HSCore.components.HSDatatables.init($('#datatable'), {
                select: {
                    style: 'multi',
                    classMap: {
                        checkAll: '#datatableCheckAll',
                        counter: '#datatableCounter',
                        counterInfo: '#datatableCounterInfo'
                    }
                },
                language: {
                    zeroRecords: '<div class="text-center p-4">' +
                        '<img class="w-7rem mb-3" src="<?php echo e(asset('public/assets/admin/svg/illustrations/sorry.svg')); ?>" alt="Image Description">' +
                        '<p class="mb-0"><?php echo e(translate('No_data_to_show')); ?></p>' +
                        '</div>'
                }
            });

            $('#datatableSearch').on('mouseup', function(e) {
                var $input = $(this),
                    oldValue = $input.val();

                if (oldValue == "") return;

                setTimeout(function() {
                    var newValue = $input.val();

                    if (newValue == "") {
                        // Gotcha
                        datatable.search('').draw();
                    }
                }, 1);
            });

            $('#toggleColumn_index').change(function(e) {
                datatable.columns(0).visible(e.target.checked)
            })
            $('#toggleColumn_name').change(function(e) {
                datatable.columns(1).visible(e.target.checked)
            })

            $('#toggleColumn_type').change(function(e) {
                datatable.columns(2).visible(e.target.checked)
            })

            $('#toggleColumn_vendor').change(function(e) {
                datatable.columns(3).visible(e.target.checked)
            })

            $('#toggleColumn_status').change(function(e) {
                datatable.columns(5).visible(e.target.checked)
            })
            $('#toggleColumn_price').change(function(e) {
                datatable.columns(4).visible(e.target.checked)
            })
            $('#toggleColumn_action').change(function(e) {
                datatable.columns(6).visible(e.target.checked)
            })

            // INITIALIZATION OF SELECT2
            // =======================================================
            $('.js-select2-custom').each(function() {
                var select2 = $.HSCore.components.HSSelect2.init($(this));
            });
        });

        $('#restaurant').select2({
            ajax: {
                url: '<?php echo e(url('/')); ?>/admin/restaurant/get-restaurants',
                data: function(params) {
                    return {
                        q: params.term, // search term
                        all: true,
                        page: params.page
                    };
                },
                processResults: function(data) {
                    return {
                        results: data
                    };
                },
                __port: function(params, success, failure) {
                    var $request = $.ajax(params);

                    $request.then(success);
                    $request.fail(failure);

                    return $request;
                }
            }
        });

        $('#category').select2({
            ajax: {
                url: '<?php echo e(route('admin.category.get-all')); ?>',
                data: function(params) {
                    return {
                        q: params.term, // search term
                        all: true,
                        page: params.page
                    };
                },
                processResults: function(data) {
                    return {
                        results: data
                    };
                },
                __port: function(params, success, failure) {
                    var $request = $.ajax(params);

                    $request.then(success);
                    $request.fail(failure);

                    return $request;
                }
            }
        });


    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\halaltogo\resources\views/admin-views/product/list.blade.php ENDPATH**/ ?>