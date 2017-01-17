$(function(){
  $('input[type=file]').on('change', function (e) {
    console.log(e.target.files);
    if (e.target.files[0].size > 0) {
        $(this).parents('form').submit();
    }
  });

    $('.profile-edit-btn-sub').on('click', function () {
    $('.profile-nav-left-info').submit();
  });

});
