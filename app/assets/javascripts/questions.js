jQuery(document).ready(function($) {
  $("i.question-upvote").on("click", function(){
    window.icon = $("i.question-upvote");
    var id = $(this).attr('data-id');
    var action = $(this).attr('data-action');
    $.post("/questions/" + id, {_method: "put", action: action}, function(response){
      icon.siblings("span").html(response.aura);
    });
  });

  $("i.question-downvote").on("click", function(){
    
  });

  $("i.answer-upvote").on("click", function(){
    
  });

  $("i.answer-downvote").on("click", function(){
    
  });
});
