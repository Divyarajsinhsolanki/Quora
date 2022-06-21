class AnswersController < ApplicationController
#  before_action :authenticate_user!

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(@answer.question_id)
    @answers  =  @question.answers 
    @user =  User.find(@question.user_id)
    @topic =  Topic.find(@question.topic_id)

    if @answer.save
      respond_to do |format|
        format.html 
        format.js 
      end
    end 
  end

  def index
  end

  def edit
  end

  def show
  end


private

 def answer_params
    params.require(:answer).permit(:answer, :question_id, :user_id)
  end


end
