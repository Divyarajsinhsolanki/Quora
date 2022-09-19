import consumer from "channels/consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    alert(data['message'])

    #speak function
  
  $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    if event.keyCode is 13 # return/enter = send
      App.room.speak event.target.value
      event.target.value = ''
      event.preventDefault()
    // Called when there's incoming data on the websocket for this channel
  },

  speak: function(message) {
    @perform 'speak', message: message
    return this.perform('speak');
  }
});
