$(function(){
    $('.header-list').on('click',function(e){
        $(this).children('#drop-child').show();
  });

  $(document).on('click', function(e) {
    console.log(e);
    if (!$(e.target).closest('.header-list').length){
      $('#drop-child').fadeOut();
  }
});
});
