class QuestionsController < ApplicationController
  include Stripe::Callbacks
  include ApplicationHelper
  skip_before_action :authenticate_user!

  def new
    @question = Question.new
    @questions = current_user.questions.where(publish: true).paginate(page: params[:page], per_page: 10)
    @user = current_user
  end

  def readcsv
    flash[:danger] = 'file uploading'
    read = CSV.read(params[:file].path)
    FirstWorker.perform_async(read,current_user.id)
    redirect_to new_question_path
  end

  def create
    @question = Question.new(question_params)
    unless @question.save
      flash[:danger] = 'invalid Question'
    end
    if current_user.questions.last.publish == true
      redirect_to new_question_path
    else
      redirect_to success_path
    end
  end

  def show
    @answer   = Answer.new
    @question = Question.includes({answers: :user}, :user, :topic).find(params[:id])
    @answers = @question.answers.order(created_at: :desc)
    @user = @question.user
    @topic =  @question.topic
  end

  def index
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers
  end

  def edit; end
  def destroy; end

  private

  def question_params
    params.require(:question).permit(:question, :topic_id, :user_id)
  end
end
