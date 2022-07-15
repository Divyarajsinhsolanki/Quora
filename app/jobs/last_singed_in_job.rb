class LastSingedInJob < ApplicationJob
  queue_as :default

  def perform(rowarray,id)

    if  Topic.find_by(user_id: id,name: rowarray.first.second).present?
      @topic = Topic.find_by(user_id: id,name: rowarray.first.second)
      @topic.update(user_id: id,name: rowarray.first.second)
    else
      @topic = Topic.new(user_id: id,name: rowarray.first.second)
      @topic.save
    end

    # @topic = Topic.find_by(name: rowarray.first.second).id

    @question = Question.find_or_initialize_by(user_id: id,question: rowarray.first.first,topic_id: @topic.id)
    @question.save 

  end
end
