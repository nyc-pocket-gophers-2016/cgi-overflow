$(document).ready(function() {
  $(".post-container").on("submit", ".upvote_question", function(event) {
    event.preventDefault();

    var $events = $(event.target)
    var reqArgs = {
      url: $events.attr("action"),
      method: 'post',
      data: $events.serialize(),
      dataType: 'html'
    };
    var reqObj = $.ajax(reqArgs)
    reqObj.done(function(response){
      $events.parent().find(".question_points").html('<p class="question_points">Points: ' +response+ '</p>');
    })
  });


  $(".post-container").on("submit", ".downvote_question", function(event) {
    event.preventDefault();

    var $events = $(event.target)

    var reqArgs = {
      url: $events.attr("action"),
      method: 'post',
      data: undefined,
      dataType: 'html'
    };
    var reqObj = $.ajax(reqArgs)
    reqObj.done(function(response){
      $events.parent().find(".question_points").html('<p class="question_points">Points: ' +response+ '</p>');
    })
  });
});


$(document).ready(function() {
  $(".post-container").on("submit", ".upvote_answer", function(event) {
    event.preventDefault();

    var $events = $(event.target)
    var reqArgs = {
      url: $events.attr("action"),
      method: 'post',
      data: $events.serialize(),
      dataType: 'html'
    };

    var reqObj = $.ajax(reqArgs)
    reqObj.done(function(response){
      $events.parent().find(".answer_points").html('<p class="answer_points">Points: ' +response+ '</p>');
    })
  });




  $(".post-container").on("submit", ".downvote_answer", function(event) {
    event.preventDefault();

    var $events = $(event.target)

    var reqArgs = {
      url: $events.attr("action"),
      method: 'post',
      data: $events.serialize(),
      dataType: 'html'
    };
    var reqObj = $.ajax(reqArgs)
    reqObj.done(function(response){
      $events.parent().find(".answer_points").html('<p class="answer_points">Points: ' +response+ '</p>');
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
  $('.answer_container').on('submit', '.form', function(event){    event.preventDefault();

    var $target = event.target;
    $.ajax({
      url: $target.action,
      type: $target.method,
      data: $($target).serialize()
    }).done(function(response){
        $('ul').prepend(response);
        $('.form').remove();
        $('.answer_form_heading').remove();
    });


  });

  $('#qcomment').on('submit', function(event){
    event.preventDefault();

    var $target = $(event.target)

    $.ajax({
      url: $target.attr('action'),
      method: 'get'
    }).done(function(response){
      $('.question-container').append(response);
    });
  });

  $('.question-container').on('submit','#question-comment-form',function(event){
    event.preventDefault();
    var $target = $(event.target)
    $.ajax({
      url: $target.attr('action'),
      method: $target.attr('method'),
      data: $target.serialize(),
      dataType: 'html'
    }).done(function(response){
      $('.question-container').append(response);
      $('#question-comment-form').remove();
    })

  });

    $('.comment-link').on('click', function(event){
    event.preventDefault();

    var $target = $(event.target)

    $.ajax({
      url: $target.attr('href'),
      method: 'get'
    }).done(function(response){
      $target.parent().append(response);
    });
  });

$('#answer-list').on('submit','#answer-comment-form',function(event){
    event.preventDefault();
    var $target = $(event.target)
    $.ajax({
      url: $target.attr('action'),
      method: $target.attr('method'),
      data: $target.serialize(),
      dataType: 'html'
    }).done(function(response){
      $target.parent().append(response);
      $target.remove();
    })
  });
});
