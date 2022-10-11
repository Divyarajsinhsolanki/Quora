class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @questions_group_by_topic = Question.includes(:topic, answers:{ user:{avatar_attachment: :blob}}, user: {avatar_attachment: :blob}).where(publish: true).paginate(page: params[:page], per_page: 10).reverse_order.group_by(&:topic)
  end
end
