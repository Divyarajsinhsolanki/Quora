class TypingChannel < ApplicationCable::Channel
  def subscribed
      stream_from "typing_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
