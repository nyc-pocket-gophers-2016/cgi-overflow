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
      $vote_happens.css("color", "green");
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
