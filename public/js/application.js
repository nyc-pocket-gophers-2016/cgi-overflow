$(document).ready(function() {
  $(".post-container").on("click", ".upvote", function(event) {
    event.preventDefault();

    var $vote_happens = $(event.target)

    var reqArgs = {
      url: $vote_happens.parent().attr("action"),
      method: 'post',
      data: undefined,
      dataType: 'html'
    };
    var reqObj = $.ajax(reqArgs)
    reqObj.done(function(response){
      $vote_happens.parent().parent().find("p > .points").html(response);

    })
  });

  $(".post-container").on("click", ".downvote", function(event) {
    event.preventDefault();

    var $vote_happens = $(event.target)

    var reqArgs = {
      url: $vote_happens.parent().attr("action"),
      method: 'post',
      data: undefined,
      dataType: 'html'
    };
    var reqObj = $.ajax(reqArgs)
    reqObj.done(function(response){
      $vote_happens.parent().parent().find("p > .points").html(response);
      $vote_happens.css("color", "red");
    })
  });
});

$(function() {

  $('.answer_form').submit(function(event){
    event.preventDefault();

    $(this).hide();

    var url = $('.answer_url').data('url');

    $.get(url, function(response) {
      $('.answer_container').append(response);

    });

  });

  $('.answer_container').on('submit', '.answer_form', function(event){
    event.preventDefault();

    var url = $(this).attr('action');

    var data = $(this).serialize();

    $.post(url, data, function(response){
      $('li').append(response);

    });
    $(this).remove();

    $('h1').remove();

    $('.answer_form').show();

  });

});