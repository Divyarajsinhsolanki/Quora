class TopicsController < ApplicationController
  # before_filter :authenticate_user!

  def new; end

  def index
    @topics = Topic.paginate(page: params[:page], per_page: 10)
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topics = Topic.all

    if @topic.save
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def destroy
    @topic = current_user.topics.find(params[:id]).destroy
    redirect_to user_topics_path
  end

  def show
    @topic     = Topic.find(params[:id])
    @questions = Question.where(topic_id: @topic.id)
    @user      = current_user
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :user_id)
  end
end
