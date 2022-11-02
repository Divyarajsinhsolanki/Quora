class MessagesController < ApplicationController
  def create
    @current_user = current_user
    @message = @current_user.messages.create(content: msg_params[:content], room_id: params[:room_id])
    @tmping = []
    ActionCable.server.broadcast "room_channel",{message: ""} 
  end

  def index
    @tmping = []
  end

  private
  def msg_params
    params.require(:message).permit(:content)
  end
end