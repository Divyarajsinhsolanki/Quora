class QuestionsController < ApplicationController

  def new
  @question =  Question.new
  end

  def create

    @question =  Question.new(question_params)

    if  @question.save
        redirect_to user_questions_path
    else
      render 'new'
    end
  end

  def show 
    @question = current_user.questions.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers
  end

  def index
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
