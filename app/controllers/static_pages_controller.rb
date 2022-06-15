class StaticPagesController < ApplicationController
  
  def home 
    @topics = Topic.all
    @questions_group_by_topic = Question.all.group_by(&:topic)
    
  end

  def help
    @answers = current_user.answers
  end

  def about
  end

  def contact
    @answer   = Answer.new
    @question = Question.find(params[:id])
    @answers  =  @question.answers 
  end
end 
