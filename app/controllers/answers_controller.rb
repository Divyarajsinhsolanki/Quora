class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)

    if @answer.save
       flash[:success] = "successful"
      redirect_to user_questions_path
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
    params.require(:answer).permit(:answer, :questions_id, :user_id)
  end


end
