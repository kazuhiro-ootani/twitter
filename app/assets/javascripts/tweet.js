$(function(){

    setInterval(function(){
    reload();
  },15000);

  function reload(){
    $.ajax({
    type: 'GET',
    url: '/tweets.json',
    dataType: 'json'
  }).done(function(data) {
    var all_message_num = $('.tweet-list').length;

    if (all_message_num !== data.length){
      var data_num = data.length;
      var num = data_num - all_message_num;
      if (num > 0){
        var htm =
        '<div class="message-alarm" data-number =' +
         num +
          '>' +
          num +
        '件の新着ツイートを表示' +
        '</div>';
      $('.message-alarm-wrapper').html(htm);
      };
      $('.message-alarm').on('click', function() {
          click(num,data);
      });
    };
    });
    function click(num,data){
        for (var i = num; i >0; i--){
        var html_tag = buildNewTweetComponent(data[i-1]);
        $(html_tag).prependTo('.tweet-lists').hide().fadeIn(1000);
        $('.message-alarm-wrapper').empty(html_tag);
        };
      };
  };

  function buildNewTweetComponent(message){
    var mark = "@";
    var html =
    '<li class="tweet-list">'+
    '<div class="message-tweet-content">' +
    '<div class="content">' +
    '<img class="tweet-user-icon" src="' +
    message.user_img.user_img.url +
    '" alt="A231269 0" />' +
    '<div class="content-header">' +
    '<span class="nickname">' +
    message.nickname +
    '</span>' +
    '<span class="id">' +
    mark +
    message.username +
    '</span>' +
    '<span class="timestamps">' +
    message.created_at +
    '</span>' +
    '<div class="content-main-text">' +
    message.text +
    '</div>' +
    '</div>' +
    '<div class="content-btn">' +
    '<div class="reply-btn">' +
    '<div class="fa fa-reply">' +
    '</div>'+
    '</div>' +
    '<div class="retweet-btn">' +
    '<div class="fa fa-retweet">' +
    '</div>'+
    '</div>'+
    '<div class="favorite-btn">' +
    '<div class="fa fa-heart">' +
    '</div>' +
    '</div>' +
    '<div class="detail-btn">'+
    '<div class="fa fa-ellipsis-h">' +
    '</div>' +
    '</div>' +
    '</div>' +
    '</div>' +
    '</div>' +
    '</li>';
    return html;
  };

  $('#message-tweet-button').on('click',function(e){
  e.preventDefault();
  if ($('.message-input').val() == ""){
    alert("メッセージを入れてね！");
  }
  else{
  var textField = $(".message-input");
  var form = $('#new_tweet').get()[0];
  console.log(form);

  var formData = new FormData(form);
  $.ajax({
    type: 'POST',
    url: '/tweets.json',
    data: formData,
    dataType: 'json',
    processData: false,
    contentType: false,
  })
  .done(function(data){
    var added_html = buildNewTweetComponent(data);
    $('ul.tweet-lists').prepend(added_html);
    textField.val('');
  })
  }
  });
});
