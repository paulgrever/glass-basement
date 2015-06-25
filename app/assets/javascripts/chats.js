$(document).ready(function(){
  var socket = io("http://localhost:2222");
  var $chatId = $("#job-id").val();

  socket.on('message', function(message) {
    var data = $.parseJSON(message);
    appendMessage(data.chat.body, data.user.image, data.user.name);
    scrollBottom();
  });
  scrollBottom();

});

var appendMessage = function(message, image, name) {
  $(".messages").append("<div class='col s12 m12 l12'>" + 
                          "<div class='row valign-wrapper section'>" +
                            "<div class='col s2'>" +
                              "<img src=" + image + " alt='' class='circle responsive-img'>" +
                            "</div>" +
                            "<div class='col s10'>" +
                              "<span class='black-text'>" +
                                "<strong>[" + name + "]: </strong>" + message + 
                            "</div>" +
                          "</div>" +
                          "<div class='divider'></div>" +
                        "</div>" 

    );
  return $("#chat-input" ).val("");
}

var scrollBottom = function(){
 $(".messages").scrollTop($(".messages")[0].scrollHeight);
};
