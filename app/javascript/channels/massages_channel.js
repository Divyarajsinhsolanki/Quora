import consumer from "channels/consumer"

consumer.subscriptions.create("MassagesChannel", {
  connected() {
    console.log("Connected to the channel:", this);
  },
  disconnected() {
    console.log("Disconnected");
  },
  received(data) {
    console.log("Received some data:", data);
  }
});
