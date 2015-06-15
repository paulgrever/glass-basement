$(document).ready(function(){
  $("#chat-form").on("ajax:success", function(e, data, status, xhr){
    $(".messages").append("<div>" + data.body + " </div>");
    return $(" #chat-input" ).val("");
  }).on("ajax:error", function(e, xhr, status, error){
    console.log(error);
  });
});