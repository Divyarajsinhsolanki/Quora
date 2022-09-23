class RoomsController < ApplicationController

  # def new
  #   @room = Room.new
  #   @rooms = Room.all
  #   render "index"
  # end

  def show
    @single_room = Room.find(params[:id])
    @rooms = Room.all
    @room = Room.new
    @message = Message.new
    @messages = @single_room.messages
    @current_user = current_user
    render "index"

  end
  
  def create 
    @room = Room.create(name: params["room"]["name"])
  end

  def index
    @room = Room.new
    @rooms = Room.all
  end
end