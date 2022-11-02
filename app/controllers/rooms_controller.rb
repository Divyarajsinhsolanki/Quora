class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show ]

  def show
    @single_room = Room.find(params[:id])
    @rooms = Room.all
    @room = Room.new
    @msgs = Msg.all
    @message = Message.new
    @user = current_user  
    @messages = @single_room.messages
    @current_user = current_user
    render "index"
  end

  def rtm 
    @msg = Msg.find_or_create_by(text: "#{current_user.firstname || current_user.name || current_user.email} is Typing..") 
  end

  def rmm 
    Msg.destroy_all
  end


  def create 
    @room = Room.create(name: params["room"]["name"])
  end

  def index
    @room = Room.new
    @rooms = Room.all
  end

private
  def set_room
    @room = Room.find(params[:id])
  end
end
