$(function(){
    $('.user__icon.header-list').on('click',function(e){
        $(this).children('#drop-child').slideToggle();
        e.stopPropagation();
  });

  $(document).on('click', function() {
    $('#drop-child').hide();
    });

  $('#drop-child').click(function(e) {e.stopPropagation();});
});
