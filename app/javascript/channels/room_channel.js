import consumer from "channels/consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    console.log("online users")
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    window.scrollTo(0,document.body.scrollHeight);

    // Called when there's incoming data on the websocket for this channel
  }
});
