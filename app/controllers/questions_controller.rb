class QuestionsController < ApplicationController
#  before_action :authenticate_user!

  def new
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
      redirect_to user_questions_path
    end
  end

  def show 
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers
  end

  def index
  @question =  Question.new
    @questions = current_user.questions
  
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
