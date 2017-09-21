
var addToLog = function(id, txt) {
  $(id + " .logs").append("<br>" + txt);
};

// ===========================
// Blockchain example
// ===========================
$(document).ready(function() {

 $("button.thumbs_up").click(function() {
   console.log(parseInt($(this).parent().prop('className')));
   DetailedPost.upvote(parseInt($(this).parent().prop('className'))).then(function(result){
      console.log(result);
   });
   //addToLog(“up_voted”);
 });

 $("button.thumbs_down").click(function() {
   DetailedPost.downvote(parseInt($(this).parent().prop('className'))).then(function(result){
      console.log(result);
   });
   //addToLog(“down_voted”);
 });

 $(".submit").click(function() {
   console.log("sdf");
   DetailedPost.createPost($('.postid').val(), $('.postcontent').val()).then(function(result){
      console.log(result);
   });
 });

});


