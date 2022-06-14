class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)

    if @answer.save
       flash[:success] = "successful"
      redirect_to user_question_path(current_user, @answer.question)
    else
      flash[:danger] = "Invalid"
      render "new"
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
