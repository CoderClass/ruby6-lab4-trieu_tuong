// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
window.updateMessagesViaJSON = function(url) {
  console.log("inside updateMessagesViaJSON");
  $.getJSON(url, function(messages) {
    // this is the data you receive from http://localhost:3000/rooms/1/messages.json
    // loop through the messages and render them
    // you can use $(".messages").append("blah") 
    // to add blah to the <div class="messages">...</div> element
    $(".messages").html("");
    for(var i = 0; i < messages.length; i++) {
    	$(".messages").append("<li>" + messages[i].username + ": " + messages[i].content + "</li>");
    }
  })
}