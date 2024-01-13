<!DOCTYPE html>
    <?php
    $log_email_succ = session()->get('log_email_succ');
    ?>
<html dir="<?php echo e($site_direction); ?>" lang="<?php echo e($locale); ?>" class="<?php echo e($site_direction === 'rtl'?'active':''); ?>">
<head>
    <!-- Required Meta Tags Always Come First -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <?php
        $app_name = \App\CentralLogics\Helpers::get_business_settings('business_name', false);
        $icon = \App\CentralLogics\Helpers::get_business_settings('icon', false);
    ?>
    <!-- Title -->
    <title><?php echo e(translate('messages.login')); ?> | <?php echo e($app_name??translate('HalalToGo')); ?></title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="<?php echo e(asset($icon ? 'storage/app/public/business/'.$icon : 'public/favicon.ico')); ?>">

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&amp;display=swap" rel="stylesheet">
    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="<?php echo e(asset('public/assets/admin')); ?>/css/vendor.min.css">
    <link rel="stylesheet" href="<?php echo e(asset('public/assets/admin')); ?>/vendor/icon-set/style.css">
    <!-- CSS Front Template -->
    <link rel="stylesheet" href="<?php echo e(asset('public/assets/admin')); ?>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo e(asset('public/assets/admin')); ?>/css/theme.minc619.css?v=1.0">
    <link rel="stylesheet" href="<?php echo e(asset('public/assets/admin')); ?>/css/style.css">
    <link rel="stylesheet" href="<?php echo e(asset('public/assets/admin')); ?>/css/toastr.css">
</head>

<body>
<!-- ========== MAIN CONTENT ========== -->
<main id="content" role="main" class="main">
    <!-- Content -->
    <div class="d-flex flex-wrap align-items-center justify-content-between">
        <div class="auth-content">
            <div class="content">
            <a class="auth-logo mb-5 pl-8" href="javascript:">
                    <img class="z-index-2" onerror="this.src='<?php echo e(asset('/public/assets/admin/img/auth-fav.png')); ?>'"
                    <?php if(isset($systemlogo)): ?>
                    src="<?php echo e(asset('storage/app/public/business/' . $systemlogo->value)); ?>"
                    <?php else: ?>
                    src="<?php echo e(asset('/public/assets/admin/img/auth-fav.png')); ?>"
                    <?php endif; ?>
                    >
                </a>

                <h2 class="title" style="color:black">Bienvenue à HalalToGo</h2>
                <p>
                Gérez facilement votre application et votre site Web
                </p>
            </div>
        </div>
        <div class="auth-wrapper">
            <div class="auth-wrapper-body auth-form-appear">
                <?php ($systemlogo=\App\Models\BusinessSetting::where(['key'=>'logo'])->first()); ?>
                <?php ($role = $role ?? null ); ?>
                <a class="auth-logo mb-5" href="javascript:">
                    <img class="z-index-2" onerror="this.src='<?php echo e(asset('/public/assets/admin/img/auth-fav.png')); ?>'"
                    <?php if(isset($systemlogo)): ?>
                    src="<?php echo e(asset('storage/app/public/business/' . $systemlogo->value)); ?>"
                    <?php else: ?>
                    src="<?php echo e(asset('/public/assets/admin/img/auth-fav.png')); ?>"
                    <?php endif; ?>
                    >
                </a>
                <div class="text-center">
                    <div class="auth-header mb-5">
                        <h2 class="signin-txt">Connectez-vous à votre panneau</h2>
                    </div>
                </div>
                <!-- Content -->
             
                <!-- Form -->
                <form class="login_form" action="<?php echo e(route('login_post')); ?>" method="post" id="form-id">
                    <?php echo csrf_field(); ?>
                    <input type="hidden" name="role" value="<?php echo e($role ?? null); ?>">

                    <div class="js-form-message form-group mb-2">
                        <label class="form-label text-capitalize" for="signinSrEmail">Votre email</label>
                        <input type="email" class="form-control form-control-lg" value="<?php echo e($email ?? ''); ?>" name="email" id="signinSrEmail"
                            tabindex="1" aria-label="email@address.com"
                            required data-msg="Please enter a valid email address.">
                        <div class="focus-effects"></div>
                    </div>
                    <!-- End Form Group -->

                    <!-- Form Group -->
                    <div class="js-form-message form-group">
                        <label class="form-label text-capitalize" for="signupSrPassword" tabindex="0">
                            <span class="d-flex justify-content-between align-items-center">
                            Mot de passe
                            </span>
                        </label>
                        <div class="input-group input-group-merge">
                            <input type="password" class="js-toggle-password form-control form-control-lg __rounded"
                                name="password" id="signupSrPassword" value="<?php echo e($password ?? ''); ?>"
                                aria-label="<?php echo e(translate('messages.password_length_placeholder',['length'=>'6+'])); ?>" required
                                data-msg="<?php echo e(translate('messages.invalid_password_warning')); ?>"
                                data-hs-toggle-password-options='{
                                            "target": "#changePassTarget",
                                    "defaultClass": "tio-hidden-outlined",
                                    "showClass": "tio-visible-outlined",
                                    "classChangeTarget": "#changePassIcon"
                                    }'>

                            <div class="focus-effects"></div>
                            <div id="changePassTarget" class="input-group-append">
                                <a class="input-group-text" href="javascript:">
                                    <i id="changePassIcon" class="tio-visible-outlined"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- End Form Group -->
                        <div class="mb-2"></div>
                        <div class="d-flex justify-content-between mt-5">
                    <!-- Checkbox -->
                        <div class="form-group">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="termsCheckbox" <?php echo e($password ? 'checked' : ''); ?>

                                    name="remember">
                                <label class="custom-control-label text-muted" for="termsCheckbox">
                                Souviens-toi de moi
                                </label>
                            </div>
                        </div>
                    <!-- End Checkbox -->
                    <!-- forget password -->
                        <div class="form-group"  id="forget-password" style="display: <?php echo e($role == 'admin' ? '' : 'none'); ?>;">
                            <div class="custom-control">
                                <span type="button" data-toggle="modal" data-target="#forgetPassModal">Mot de passe oublié</span>
                            </div>
                        </div>
                        <div class="form-group"  id="forget-password1" style="display: <?php echo e($role == 'vendor' ? '' : 'none'); ?>;">
                            <div class="custom-control">
                                <span type="button" data-toggle="modal" data-target="#forgetPassModal1">Mot de passe oublié</span>
                            </div>
                        </div>
                    </div>
                    <!-- End forget password -->


                    
                    <?php ($recaptcha = \App\CentralLogics\Helpers::get_business_settings('recaptcha')); ?>
                    <?php if(isset($recaptcha) && $recaptcha['status'] == 1): ?>
                        <div id="recaptcha_element" class="w-100" data-type="image"></div>
                        <br/>
                    <?php else: ?>
                    <div class="row p-2" id="reload-captcha">
                        <div class="col-6 pr-0">
                            <input type="text" class="form-control form-control-lg form-recapcha" name="custome_recaptcha"
                                    id="custome_recaptcha" required placeholder="Entrez la valeur recaptcha" autocomplete="off" value="<?php echo e(env('APP_MODE')=='dev'? session('six_captcha'):''); ?>">
                        </div>
                        <div class="col-6 bg-white rounded d-flex">
                            <img src="<?php echo $custome_recaptcha->inline(); ?>" class="rounded w-100" />
                            <div class="p-3 pr-0"  onclick="reloadCaptcha()">
                                <i class="tio-cached"></i>
                            </div>
                            
                        </div>
                    </div>
                    <?php endif; ?>

                    <button type="submit" class="btn btn-lg btn-block btn-primary">Se connecter</button>
                </form>
                <!-- End Form -->

                <!-- End Content -->
            </div>
            <?php if(env('APP_MODE') =='demo' ): ?>
                <?php if(isset($role) &&  $role == 'admin'): ?>
                    <div class="auto-fill-data-copy">
                        <div class="d-flex flex-wrap align-items-center justify-content-between">
                            <div>
                                <span class="d-block"><strong>Email</strong> : admin@admin.com</span>
                                <span class="d-block"><strong>Password</strong> : 12345678</span>
                            </div>
                            <div>
                                <button class="btn btn-primary m-0" onclick="copy_cred()"><i class="tio-copy"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                <?php endif; ?>
                <?php if(isset($role) &&  $role == 'vendor'): ?>
                    <div class="auto-fill-data-copy">
                        <div class="d-flex flex-wrap align-items-center justify-content-between">
                            <div>
                                <span class="d-block"><strong>Email</strong> : test.restaurant@gmail.com</span>
                                <span class="d-block"><strong>Password</strong> : 12345678</span>
                            </div>
                            <div>
                                <button class="btn btn-primary m-0" onclick="copy_cred2()"><i class="tio-copy"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                <?php endif; ?>
            <?php endif; ?>
        </div>
    </div>
</main>
<!-- ========== END MAIN CONTENT ========== -->


<div class="modal fade" id="forgetPassModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header justify-content-end">
          <span type="button" class="close-modal-icon" data-dismiss="modal">
              <i class="tio-clear"></i>
          </span>
        </div>
        <div class="modal-body">
          <div class="forget-pass-content">
              <img src="<?php echo e(asset('/public/assets/admin/img/send-mail.svg')); ?>" alt="">
              <!-- After Succeed -->
              
              <h4>
                  <?php echo e(translate('Send_Mail_to_Your_Email_?')); ?>

              </h4>
              <p>
                  <?php echo e(translate('A_mail_will_be_send_to_your_registered_email_with_a_link_to_change_passowrd')); ?>

              </p>
              <a class="btn btn-lg btn-block btn--primary mt-3" href="<?php echo e(route('reset-password')); ?>">
                  <?php echo e(translate('Send_Mail')); ?>

              </a>
              
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="forgetPassModal1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header justify-content-end">
          <span type="button" class="close-modal-icon" data-dismiss="modal">
              <i class="tio-clear"></i>
          </span>
        </div>
        <div class="modal-body">
          <div class="forget-pass-content">
              <img src="<?php echo e(asset('/public/assets/admin/img/send-mail.svg')); ?>" alt="">
              <!-- After Succeed -->
              <h4>
                  <?php echo e(translate('messages.Send_Mail_to_Your_Email_?')); ?>

              </h4>
              <form class="" action="<?php echo e(route('vendor-reset-password')); ?>" method="post">
                  <?php echo csrf_field(); ?>

                  <input type="email" name="email" id="" class="form-control" required>
                  <button type="submit" class="btn btn-lg btn-block btn--primary mt-3"><?php echo e(translate('messages.Send_Mail')); ?></button>
              </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="successMailModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header justify-content-end">
            <span type="button" class="close-modal-icon" data-dismiss="modal">
                <i class="tio-clear"></i>
            </span>
          </div>
          <div class="modal-body">
            <div class="forget-pass-content">
                <!-- After Succeed -->
                <img src="<?php echo e(asset('/public/assets/admin/img/sent-mail.svg')); ?>" alt="">
                <h4>
                  <?php echo e(translate('A_mail_has_been_sent_to_your_registered_email')); ?>!
                </h4>
                <p>
                  <?php echo e(translate('Click_the_link_in_the_mail_description_to_change_password')); ?>

                </p>
            </div>
          </div>
        </div>
      </div>
    </div>


<!-- JS Implementing Plugins -->
<script src="<?php echo e(asset('public/assets/admin')); ?>/js/vendor.min.js"></script>

<!-- JS Front -->
<script src="<?php echo e(asset('public/assets/admin')); ?>/js/theme.min.js"></script>
<script src="<?php echo e(asset('public/assets/admin')); ?>/js/toastr.js"></script>
<?php echo Toastr::message(); ?>


<?php if($errors->any()): ?>
    <script>
        <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        toastr.error('<?php echo e(translate($error)); ?>', Error, {
            CloseButton: true,
            ProgressBar: true
        });
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </script>
<?php endif; ?>
<?php if($log_email_succ): ?>
<?php (session()->forget('log_email_succ')); ?>
    <script>
        $('#successMailModal').modal('show');
    </script>
<?php endif; ?>

<script>
    // $("#forget-password").hide();
      $("#role-select").change(function() {
        var selectValue = $(this).val();
        if (selectValue == "admin") {
          $("#forget-password").show();
          $("#forget-password1").hide();
        } else if(selectValue == "vendor") {
          $("#forget-password").hide();
          $("#forget-password1").show();
        }
        else {
          $("#forget-password").hide();
          $("#forget-password1").hide();
        }
      });
</script>


<script>
    function reloadCaptcha() {
        $.ajax({
            url: "<?php echo e(route('reload-captcha')); ?>",
            type: "GET",
            dataType: 'json',
            beforeSend: function () {
                $('#loading').show()
            },
            success: function(data) {
                $('#reload-captcha').html(data.view);
            },
            complete: function () {
                $('#loading').hide()
            }
        });
    }
</script>
<!-- JS Plugins Init. -->
<script>
    $(document).on('ready', function () {
        // INITIALIZATION OF SHOW PASSWORD
        // =======================================================
        $('.js-toggle-password').each(function () {
            new HSTogglePassword(this).init()
        });

        // INITIALIZATION OF FORM VALIDATION
        // =======================================================
        $('.js-validate').each(function () {
            $.HSCore.components.HSValidation.init($(this));
        });
    });
</script>


<?php if(isset($recaptcha) && $recaptcha['status'] == 1): ?>
    <script type="text/javascript">
        var onloadCallback = function () {
            grecaptcha.render('recaptcha_element', {
                'sitekey': '<?php echo e(\App\CentralLogics\Helpers::get_business_settings('recaptcha')['site_key']); ?>'
            });
        };
    </script>
    <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
    <script>
        $("#form-id").on('submit',function(e) {
            var response = grecaptcha.getResponse();

            if (response.length === 0) {
                e.preventDefault();
                toastr.error("<?php echo e(translate('messages.Please_check_the_recaptcha')); ?>");
            }
        });
    </script>
<?php endif; ?>




<?php if(env('APP_MODE') =='demo'): ?>
    <script>
        function copy_cred() {
            $('#signinSrEmail').val('admin@admin.com');
            $('#signupSrPassword').val('12345678');
            toastr.success('Copied successfully!', 'Success!', {
                CloseButton: true,
                ProgressBar: true
            });
        }
        function copy_cred2() {
            $('#signinSrEmail').val('test.restaurant@gmail.com');
            $('#signupSrPassword').val('12345678');
            toastr.success('Copied successfully!', 'Success!', {
                CloseButton: true,
                ProgressBar: true
            });
        }
    </script>
<?php endif; ?>

<!-- IE Support -->
<script>
    if (/MSIE \d|Trident.*rv:/.test(navigator.userAgent)) document.write('<script src="<?php echo e(asset('public//assets/admin')); ?>/vendor/babel-polyfill/polyfill.min.js"><\/script>');
</script>
</body>
</html>
<?php /**PATH C:\xampp\htdocs\halaltogo\resources\views/auth/login.blade.php ENDPATH**/ ?>