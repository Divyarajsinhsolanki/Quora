class TopicsController < ApplicationController
  # before_filter :authenticate_user!

  def new
  end


  def index
    @topics = current_user.topics
    @topic = Topic.new
  end
  


  def create
      @topic = Topic.new(topic_params)

    if @topic.save
      flash[:success] = "successful"
      redirect_to user_topics_path(current_user)
    else
      flash[:danger] = "Invalid"
    end 
  end

  def destroy
    @topic = current_user.topics.find(params[:id]).destroy 
    redirect_to user_topics_path
  end

  def show

   @topic = Topic.find(params[:id])
   @questions = Question.where(topic_id: @topic.id)
   @user = current_user

  end

private

 def topic_params
    params.require(:topic).permit(:name, :user_id)
  end
end

