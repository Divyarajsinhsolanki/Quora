class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @questions = Question.includes(:topic,:user,:answers).all.where(publish: true).paginate(page: params[:page], per_page: 10)
    @questions_group_by_topic = @questions.includes(:topic,:user,answers: :user).group_by(&:topic).sort_by { |k, _v| k.created_at }.reverse
  end

  def help; end

  def about; end

  def contact; end
end
