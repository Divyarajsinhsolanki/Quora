class FirstWorker
  include Sidekiq::Worker
  def perform(read,id)
    questions = []
    read.each do |row|
      topic = Topic.find_or_initialize_by(name: row[1])
      unless topic.id.present?
        topic.user_id = id
        topic.save
      end
      question = Question.find_or_initialize_by(topic_id: topic.id, question: row[0])
      unless question.id.present?
        question.user_id = id
        question.save
        questions << question
      end
    end
    emails = []
    questions.group_by{|question| question.topic_id}.each do |topic_id, questions|
      emails << Topic.find(topic_id).followersoftopic.pluck(:email)
    end
    NotificationMailer.question(emails).deliver_later
    current_user = User.find(id)
    NotificationMailer.uploaded(current_user).deliver_later
  end
end