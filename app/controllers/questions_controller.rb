class QuestionsController < ApplicationController
#  before_action :authenticate_user!
  skip_before_action :authenticate_user!

  def new
  @question =  Question.new
    @questions = current_user.questions
  
  end

  def create

    @question =  Question.new(question_params)
    @questions = current_user.questions

    if  @question.save
      respond_to do |format|
        format.html
        format.js      
      end
    else
      flash[:danger] = "Invalid"
      redirect_to user_question_path
    end
  end

  def show 
    @answer   = Answer.new
    @question = Question.find(params[:id])
    @answers  =  @question.answers 
    @user =  User.find(@question.user_id)
    @topic =  Topic.find(@question.topic_id)
  end

  def index

    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers
  end

  def edit
  end

  def destroy
  end


private



  def question_params
    params.require(:question).permit(:question, :topic_id, :user_id)
  end


end
