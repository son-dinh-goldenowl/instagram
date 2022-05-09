$(document).ready(function () {
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
    $('#slide-img-'+indexImg).fadeIn(500);
  }, 2000);

  $(document).on('keyup', '#user_password', function() {
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
});
