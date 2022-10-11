import consumer from "channels/consumer"

consumer.subscriptions.create("TypingChannel", {
  connected() {
    console.log("connectedasdasdasdasddd-----------------------------------")
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    wall = document.getElementById('typing');
    wall.innerHTML +=  "hhhhhhhhhhh";
    console.log("connecteddd-----------------------------------")

    // Called when there's incoming data on the websocket for this channel
  }
});

