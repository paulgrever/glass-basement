$(document).ready(function(){
  var socket = io("http://localhost:2222");
  var $chatId = $("#job-id").val();

  socket.on('message', function(message) {
    appendMessage($.parseJSON(message).body);
  });
});

var appendMessage = function(message) {
  $(".messages").append("<div>" + message + " </div>");
  return $("#chat-input" ).val("");
}
