$(function(){
  function buildNewTweetComponent(message){
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
    alert("？？？？？？？？？？？？？？");
  }
  else{
  var textField = $(".message-input");
  var form = $('#new_tweet').get()[0];

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
