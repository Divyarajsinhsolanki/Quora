class MassagesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    post = Answer.find(params[:id])
    stream_for post
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
