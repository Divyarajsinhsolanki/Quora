class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @topics = Topic.all
    @questions = Question.all.where(publish: true).paginate(page: params[:page], per_page: 5)
    @questions_group_by_topic = @questions.group_by(&:topic).sort_by { |k, _v| k.created_at }.reverse

    @user = User.all
  end

  def help; end

  def about; end

  def contact; end
end
