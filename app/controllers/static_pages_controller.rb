class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home 
    @topics = Topic.all
    @questions_group_by_topic = Question.all.group_by(&:topic).sort_by{|k,v| k.created_at}.reverse
    @user = User.all
  end

  def help

    @answers = current_user.answers
  
  end

  def about
     @topics = Topic.all
   
    @questions_group_by_topic = Question.all.group_by(&:topic)
    
  end

  def contact

    @answer   = Answer.new
    @question = Question.find(params[:id])
    @answers  =  @question.answers 
    @user =  User.find(@question.user_id)
    @topic =  Topic.find(@question.topic_id)

  end
end 
