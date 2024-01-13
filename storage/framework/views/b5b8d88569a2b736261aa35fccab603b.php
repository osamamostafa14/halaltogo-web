
<div class="card-body">
    <div class="row mb-3">
        <div class="col-12">
            <?php ($params=session('dash_params')); ?>
            <?php if($params['zone_id']!='all'): ?>
                <?php ($zone_name=\App\Models\Zone::where('id',$params['zone_id'])->first()->name); ?>
            <?php else: ?>
            <?php ($zone_name=translate('All')); ?>
        <?php endif; ?>
            <div class="d-flex flex-wrap justify-content-center align-items-center">
                <span class="h5 m-0 mr-3 fz--11 d-flex align-items-center mb-2 mb-md-0">
                    <span class="legend-indicator bg-7ECAFF"></span>
                    <span><?php echo e(translate('messages.admin_commission')); ?></span> <span>:</span> <span><?php echo e(\App\CentralLogics\Helpers::format_currency(array_sum($commission))); ?></span>
                </span>
                <span class="h5 m-0 fz--11 d-flex align-items-center mb-2 mb-md-0">
                    <span class="legend-indicator bg-0661CB"></span>
                    <span><?php echo e(translate('messages.total_sell')); ?></span> <span>:</span> <span><?php echo e(\App\CentralLogics\Helpers::format_currency(array_sum($total_sell))); ?></span>
                </span> &nbsp;&nbsp;
        <?php if(\App\CentralLogics\Helpers::subscription_check()): ?>
        <span class="h5 m-0 fz--11 d-flex align-items-center mb-2 mb-md-0">
            <span class="legend-indicator bg-dddd"></span>
            <span><?php echo e(translate('Subscription')); ?></span> <span>:</span> <span><?php echo e(\App\CentralLogics\Helpers::format_currency(array_sum($total_subs))); ?></span>
        </span>
        <?php endif; ?>

        </div>
          </div>
          <div class="col-12">
              <div class="text-right mt--xl--10"><span class="badge badge-soft--info"><?php echo e(translate('messages.zone')); ?> : <?php echo e($zone_name); ?></span>
              </div>
          </div>
    </div>
    <!-- End Row -->

    <!-- Bar Chart -->
    <div class="d-flex align-items-center">
      <div class="chart--extension">
        <?php echo e(\App\CentralLogics\Helpers::currency_symbol()); ?>(<?php echo e(translate('messages.currency')); ?>)
      </div>
      <div class="chartjs-custom w-75 flex-grow-1">
          <canvas id="updatingData" class="h-20rem"
                  data-hs-chartjs-options='{
                    "type": "bar",
                    "data": {
                      "labels": ["<?php echo e(translate('messages.Jan')); ?>","<?php echo e(translate('messages.Feb')); ?>","<?php echo e(translate('messages.Mar')); ?>","<?php echo e(translate('messages.April')); ?>","<?php echo e(translate('messages.May')); ?>","<?php echo e(translate('messages.Jun')); ?>","<?php echo e(translate('messages.Jul')); ?>","<?php echo e(translate('messages.Aug')); ?>","<?php echo e(translate('messages.Sep')); ?>","<?php echo e(translate('messages.Oct')); ?>","<?php echo e(translate('messages.Nov')); ?>","<?php echo e(translate('messages.Dec')); ?>"],
                      "datasets": [{
                        "data": [<?php echo e($commission[1]); ?>,<?php echo e($commission[2]); ?>,<?php echo e($commission[3]); ?>,<?php echo e($commission[4]); ?>,<?php echo e($commission[5]); ?>,<?php echo e($commission[6]); ?>,<?php echo e($commission[7]); ?>,<?php echo e($commission[8]); ?>,<?php echo e($commission[9]); ?>,<?php echo e($commission[10]); ?>,<?php echo e($commission[11]); ?>,<?php echo e($commission[12]); ?>],
                        "backgroundColor": "#7ECAFF",
                        "hoverBackgroundColor": "#7ECAFF",
                        "borderColor": "#7ECAFF"
                      },
                      <?php if(\App\CentralLogics\Helpers::subscription_check()): ?>
                      {
                        "data": [<?php echo e($total_subs[1]); ?>,<?php echo e($total_subs[2]); ?>,<?php echo e($total_subs[3]); ?>,<?php echo e($total_subs[4]); ?>,<?php echo e($total_subs[5]); ?>,<?php echo e($total_subs[6]); ?>,<?php echo e($total_subs[7]); ?>,<?php echo e($total_subs[8]); ?>,<?php echo e($total_subs[9]); ?>,<?php echo e($total_subs[10]); ?>,<?php echo e($total_subs[11]); ?>,<?php echo e($total_subs[12]); ?>],
                        "backgroundColor": "#44f279",
                        "borderColor": "#44f279"
                      },
                      <?php endif; ?>
                      {
                        "data": [<?php echo e($total_sell[1]); ?>,<?php echo e($total_sell[2]); ?>,<?php echo e($total_sell[3]); ?>,<?php echo e($total_sell[4]); ?>,<?php echo e($total_sell[5]); ?>,<?php echo e($total_sell[6]); ?>,<?php echo e($total_sell[7]); ?>,<?php echo e($total_sell[8]); ?>,<?php echo e($total_sell[9]); ?>,<?php echo e($total_sell[10]); ?>,<?php echo e($total_sell[11]); ?>,<?php echo e($total_sell[12]); ?>],
                        "backgroundColor": "#0661CB",
                        "borderColor": "#0661CB"
                      }


                      ]
                    },
                    "options": {
                      "scales": {
                        "yAxes": [{
                          "gridLines": {
                            "color": "#e7eaf3",
                            "drawBorder": false,
                            "zeroLineColor": "#e7eaf3"
                          },
                          "ticks": {
                            "beginAtZero": true,
                            "stepSize": <?php echo e(ceil((array_sum($total_sell)/10000))*2000); ?>,
                            "fontSize": 12,
                            "fontColor": "#373D3F",
                            "fontFamily": "Open Sans, sans-serif",
                            "padding": 10
                          }
                        }],
                        "xAxes": [{
                          "gridLines": {
                            "display": false,
                            "drawBorder": false
                          },
                          "ticks": {
                            "fontSize": 12,
                            "fontColor": "#373D3F",
                            "fontFamily": "Open Sans, sans-serif",
                            "padding": 5
                          },
                          "categoryPercentage": 0.3,
                          "maxBarThickness": "10"
                        }]
                      },
                      "cornerRadius": 5,
                      "tooltips": {
                        "prefix": " ",
                        "hasIndicator": true,
                        "mode": "index",
                        "intersect": false
                      },
                      "hover": {
                        "mode": "nearest",
                        "intersect": true
                      }
                    }
                  }'>
          </canvas>
      </div>
    </div>
    <!-- End Bar Chart -->
</div>

<?php $__env->startPush('script'); ?>
    <script src="<?php echo e(asset('public/assets/admin')); ?>/vendor/chart.js/dist/Chart.min.js"></script>
    <script src="<?php echo e(asset('public/assets/admin')); ?>/vendor/chart.js.extensions/chartjs-extensions.js"></script>
    <script src="<?php echo e(asset('public/assets/admin')); ?>/vendor/chartjs-plugin-datalabels/dist/chartjs-plugin-datalabels.min.js"></script>
<?php $__env->stopPush(); ?>

<script>
    // INITIALIZATION OF CHARTJS
    // =======================================================
    Chart.plugins.unregister(ChartDataLabels);

    $('.js-chart').each(function () {
        $.HSCore.components.HSChartJS.init($(this));
    });

    var updatingChart = $.HSCore.components.HSChartJS.init($('#updatingData'));
</script>
<?php /**PATH C:\xampp\htdocs\halaltogo\resources\views/admin-views/partials/_monthly-earning-graph.blade.php ENDPATH**/ ?>