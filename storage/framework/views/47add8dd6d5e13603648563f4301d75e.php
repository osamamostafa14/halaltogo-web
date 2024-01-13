<div class="card h-100">
    <!-- Header -->
    <div class="card-header">
        <div class="chat-user-info w-100 d-flex align-items-center">
            <div class="chat-user-info-img">
                <img class="avatar-img"
                    src="<?php echo e(asset('storage/app/public/profile/'.$user['image'])); ?>"
                    onerror="this.src='<?php echo e(asset('public/assets/admin')); ?>/img/160x160/img1.jpg'"
                    alt="Image Description">
            </div>
            <div class="chat-user-info-content">
                <h5 class="mb-0 text-capitalize">
                    <?php echo e($user['f_name'].' '.$user['l_name']); ?></h5>
                <span dir="ltr"><?php echo e($user['phone']); ?></span>
            </div>
        </div>
        <div class="dropdown">
            <button class="btn shadow-none" data-toggle="dropdown">
                <img src="<?php echo e(asset('/public/assets/admin/img/ellipsis.png')); ?>" alt="">
            </button>
            <?php if($user?->user): ?>

            <ul class="dropdown-menu conv-dropdown-menu">
                
                <li>
                    <a href="<?php echo e(route('admin.customer.view', [$user->user->id])); ?>"
                        ><?php echo e(translate('view_order_list')); ?></a>
                </li>
            </ul>
            <?php endif; ?>
        </div>
    </div>

    <div class="card-body">
        <div class="scroll-down">
            <?php $__currentLoopData = $convs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $con): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php if($con->sender_id == $receiver->id): ?>
                    <div class="pt1 pb-1">
                        <div class="conv-reply-1">
                                <h6><?php echo e($con->message); ?></h6>
                                <?php if($con->file!=null): ?>
                                <?php $__currentLoopData = json_decode($con->file); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $img): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <br>
                                    <img class="w-100"
                                    src="<?php echo e(asset('storage/app/public/conversation').'/'.$img); ?>">
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                <?php endif; ?>
                        </div>
                        <div class="pl-1">
                            <small>
                                <?php echo e(\App\CentralLogics\Helpers::time_date_format($con->created_at)); ?>

                            </small>
                        </div>
                    </div>
                <?php else: ?>
                    <div class="pt-1 pb-1">
                        <div class="conv-reply-2">
                            <h6><?php echo e($con->message); ?></h6>
                            <?php if($con->file!=null): ?>
                            <?php $__currentLoopData = json_decode($con->file); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $img): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <br>
                                <img class="w-100"
                                src="<?php echo e(asset('storage/app/public/conversation').'/'.$img); ?>">
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                        </div>
                        <div class="text-right pr-1">
                            <small>   <?php echo e(\App\CentralLogics\Helpers::date_format($con->created_at)); ?>  <?php echo e(\App\CentralLogics\Helpers::time_format($con->created_at)); ?></small>
                            <?php if($con->is_seen == 1): ?>
                            <span class="text-primary"><i class="tio-checkmark-circle"></i></span>
                            <?php else: ?>
                            <span><i class="tio-checkmark-circle-outlined"></i></span>
                            <?php endif; ?>
                        </div>
                    </div>
                <?php endif; ?>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            <div id="scroll-here"></div>
        </div>

    </div>
    <!-- Body -->
    <div class="card-footer border-0 conv-reply-form">

        <form action="javascript:" method="post" id="reply-form" enctype="multipart/form-data">
            <?php echo csrf_field(); ?>
            <div class="quill-custom_">
                <label for="msg" class="layer-msg">

                </label>
                <textarea class="form-control pr--180" id="msg" rows = "1" name="reply"></textarea>
                <div class="upload__box">
                    <div class="upload__img-wrap"></div>
                    <div id="file-upload-filename" class="upload__file-wrap"></div>
                    <div class="upload-btn-grp">
                        <label class="m-0">
                            <img src="<?php echo e(asset('/public/assets/admin/img/gallery.png')); ?>" alt="">
                            <input type="file" name="images[]" class="d-none upload_input_images" data-max_length="2" accept="image/*"  multiple="" >
                        </label>
                        
                        <label class="m-0 emoji-icon-hidden">
                            <img src="<?php echo e(asset('/public/assets/admin/img/emoji.png')); ?>" alt="">
                        </label>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary btn--primary con-reply-btn"><?php echo e(translate('messages.send')); ?>

                </button>
            </div>
        </form>
    </div>
</div>

<script>
    $(document).ready(function() {
        $("#msg").emojioneArea({
            pickerPosition: "top",
            tonesStyle: "bullet",
                events: {
                    keyup: function (editor, event) {d
                        console.log(editor.html());
                        console.log(this.getText());
                    }
                }
            });
    });
</script>
<script>
    $(document).ready(function () {
    // Image Upload
    jQuery(document).ready(function () {
        ImgUpload();
    });
    function ImgUpload() {
    var imgWrap = "";
    var imgArray = [];

    $('.upload_input_images').each(function () {
        $(this).on('change', function (e) {
        imgWrap = $(this).closest('.upload__box').find('.upload__img-wrap');
        var maxLength = $(this).attr('data-max_length');

        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
        var iterator = 0;
        filesArr.forEach(function (f, index) {

            if (!f.type.match('image.*')) {
            return;
            }

            if (imgArray.length > maxLength) {
            return false
            } else {
            var len = 0;
            for (var i = 0; i < imgArray.length; i++) {
                if (imgArray[i] !== undefined) {
                len++;
                }
            }
            if (len > maxLength) {
                return false;
            } else {
                imgArray.push(f);

                var reader = new FileReader();
                reader.onload = function (e) {
                var html = "<div class='upload__img-box'><div style='background-image: url(" + e.target.result + ")' data-number='" + $(".upload__img-close").length + "' data-file='" + f.name + "' class='img-bg'><div class='upload__img-close'></div></div></div>";
                imgWrap.append(html);
                iterator++;
                }
                reader.readAsDataURL(f);
            }
            }
        });
        });
    });

    $('body').on('click', ".upload__img-close", function (e) {
        var file = $(this).parent().data("file");
        for (var i = 0; i < imgArray.length; i++) {
        if (imgArray[i].name === file) {
            imgArray.splice(i, 1);
            break;
        }
        }
        $(this).parent().parent().remove();
    });
    }

    //File Upload
    $('#file-upload').change(function(e){
        var fileName = e.target.files[0].name;
        $('#file-upload-filename').text(fileName)
    });

    });
    $(document).ready(function () {
        $('.scroll-down').animate({
            scrollTop: $('#scroll-here').offset().top
        },0);
    });


    $(function() {
        $("#coba").spartanMultiImagePicker({
            fieldName: 'images[]',
            maxCount: 3,
            rowHeight: '55px',
            groupClassName: 'attc--img',
            maxFileSize: '',
            placeholderImage: {
                image: '<?php echo e(asset('public/assets/admin/img/attatchments.png')); ?>',
                width: '100%'
            },
            dropFileLabel: "Drop Here",
            onAddRow: function(index, file) {

            },
            onRenderedPreview: function(index) {

            },
            onRemoveRow: function(index) {

            },
            onExtensionErr: function(index, file) {
                toastr.error('<?php echo e(translate('messages.please_only_input_png_or_jpg_type_file')); ?>', {
                    CloseButton: true,
                    ProgressBar: true
                });
            },
            onSizeErr: function(index, file) {
                toastr.error('<?php echo e(translate('messages.file_size_too_big')); ?>', {
                    CloseButton: true,
                    ProgressBar: true
                });
            }
        });
    });


    $('#reply-form').on('submit', function() {
        $('button[type=submit], input[type=submit]').prop('disabled',true);
            var formData = new FormData(this);
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: '<?php echo e(route('admin.message.store', [$user->user_id])); ?>',
                data: $('reply-form').serialize(),
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function(data) {
                    if (data.errors && data.errors.length > 0) {

                        if (data.errors[1] && data.errors[1].code == 'images') {
                            toastr.error(data.errors[1].message, {
                                CloseButton: true,
                                ProgressBar: true
                            });
                        } else {

                            $('button[type=submit], input[type=submit]').prop('disabled',false);
                            toastr.error('<?php echo e(translate('Write_something_to_send_massage!')); ?>', {
                                CloseButton: true,
                                ProgressBar: true
                            });
                        }

                    }else{

                        toastr.success('Message sent', {
                            CloseButton: true,
                            ProgressBar: true
                        });
                        $('#view-conversation').html(data.view);
                    }
                },
                error() {
                    toastr.error('<?php echo e(translate('Write_something_to_send_massage!')); ?>', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            });
        });
</script>
<?php /**PATH C:\xampp\htdocs\halaltogo\resources\views/admin-views/messages/partials/_conversations.blade.php ENDPATH**/ ?>