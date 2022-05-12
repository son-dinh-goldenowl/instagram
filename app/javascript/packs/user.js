$(document).on('turbolinks:load',function () {
  check_input('user_email');
  check_input('user_fullname');
  check_input('user_user_name');
  check_input('user_password');
  function check_input(field) {
    if ($('#' + field).val() != 0) {
      $('#span_' + field).addClass('placeholder-span')
      $('#' + field).addClass('placeholder-input')
    } else {
      $('#span_' + field).removeClass('placeholder-span');
      $('#' + field).removeClass('placeholder-input');
    }
  };

  $(document).on('keyup', '#user_email, #user_fullname, #user_user_name, #user_password', function () {
    if ($(this).val() != 0) {
      $('#span_' + this.id).addClass('placeholder-span');
      $('#' + this.id).addClass('placeholder-input');
    } else {
      $('#span_' + this.id).removeClass('placeholder-span');
      $('#' + this.id).removeClass('placeholder-input');
    }
  });

  $(document).on('click', '#span_user_email, #span_user_fullname, #span_user_user_name, #span_user_password', function () {
    $(this).parent().find('input').focus();
  });

  let indexImg = 1;
  setInterval(function () {
    $('#slide-img-' + indexImg).hide();
    indexImg++;
    if (indexImg == 5) {
      indexImg = 1;
    }
    $('#slide-img-' + indexImg).fadeIn(500);
  }, 2000);

  $(document).on('keyup', '#user_password', function () {
    if ($(this).val() != 0) {
      $('#hide_password').hide();
      $('#user_password').prop('type', 'password');
      $('#show_password').show();
    } else {
      $('#show_password').hide();
    }
  });

  $(document).on('click', '#show_password, #hide_password', function () {
    if (this == show_password) {
      $(this).hide()
      $('#hide_password').show();
      $('#user_password').prop('type', 'text');
    } else {
      $(this).hide()
      $('#show_password').show();
      $('#user_password').prop('type', 'password');
    }
  });

  $('#content-saved').hide();
  $('#content-tagged').hide();
  $('#content-post').show();

  $(document).on('click', '#post, #saved, #tagged', function () {
    if (this == post) {
      $('#content-saved').hide();
      $('#content-tagged').hide();
      $('#content-post').show();
      $('#saved').removeClass('border-top-dark');
      $('#tagged').removeClass('border-top-dark');
      $('#post').addClass('border-top-dark');
    } else if (this == saved) {
      $('#content-post').hide();
      $('#content-tagged').hide();
      $('#content-saved').show();
      $('#post').removeClass('border-top-dark');
      $('#tagged').removeClass('border-top-dark');
      $('#saved').addClass('border-top-dark');
    } else {
      $('#content-post').hide();
      $('#content-saved').hide();
      $('#content-tagged').show();
      $('#post').removeClass('border-top-dark');
      $('#saved').removeClass('border-top-dark');
      $('#tagged').addClass('border-top-dark');
    }
  });

  $(document).on('click', '#avatar', function () {
    $('#modal-avatar').show();
    $('.form-group').addClass('modal-open');
  });

  $(document).on('click', '#upload-photo', function () {
    $('#avatar_user').click();
  });

  $(document).on('click', '#cancel-modal', function () {
    $('#modal-avatar').hide();
    $('.form-group').removeClass('modal-open');
  });

  $(document).keydown(function (event) {
    if (event.keyCode == 27) {
      $('#modal-avatar').hide();
      $('.form-group').removeClass('modal-open');
    }
  });

  $('#avatar_user').hide();
  $(document).on('change', '#avatar_user', ({ target }) => {
    let files = $(target)[0].files;
    let fd = new FormData();
    if (files.length > 0) {
      $('#modal-avatar').hide();
      $('.form-group').removeClass('modal-open');
      fd.append('file', files[0]);
      $.ajax({
        url: '/upload-avatar',
        type: 'post',
        data: fd,
        contentType: false,
        processData: false,
        success: function (data) {
          $('.avatar-user')[0].innerHTML = data.html;
        },
      });
    }
  });

  $(document).on('click', '#delete-avt', function () {
    let status = confirm('Are you sure you want to delete ?');
    if (status == true) {
      $('#modal-avatar').hide();
      $('.form-group').removeClass('modal-open');
      $.ajax({
        type: 'POST',
        url: '/destroy-avatar',
        success(data) {
          $('.avatar-user')[0].innerHTML = data.html;
        }
      });
    }
  });

  $(document).on('click', '#form-change-password', function () {
    $('#edit-info').hide();
    $('#change-password').show();
    $('#link-edit-profile').addClass('bg-light');
    $('#form-change-password').addClass('bg-primary');
  });
});
