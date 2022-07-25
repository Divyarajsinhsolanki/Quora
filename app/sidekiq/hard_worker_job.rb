class HardWorkerJob
  include Sidekiq::Worker
  queue_as :default

  def perform(read,id)
    # p read
    # CSV.foreach(myfile.path) do |row|
    #   rowarray = Array.new
    #   rowarray << row

    #   @topic = Topic.find_or_initialize_by(user_id: id,name: rowarray.first.second)
    #   @topic.save 
    #   @question = Question.find_or_initialize_by(user_id: id,question: rowarray.first.first,topic_id: @topic.id)
    #   @question.save 
    # end
  end
end
