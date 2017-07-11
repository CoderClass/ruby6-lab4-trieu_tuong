App.messages = App.cable.subscriptions.create("MessagesChannel", {
  connected: function() {
  	console.log("connected");
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
  	console.log("disconnected");
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
  	console.log({
  		"data received": data
  	});
  	//$(".messages").append(data.message)
    // Called when there's incoming data on the websocket for this channel
  },

  test: function(data) {
  	this.perform('test', {
  		message: data
  	});
  }
});
