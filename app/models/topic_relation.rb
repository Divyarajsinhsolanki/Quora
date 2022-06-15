class TopicRelation < ApplicationRecord

	belongs_to :follower_topic,    class_name: "User"
	belongs_to :topic_added   ,    class_name: "Topic"


		validates  :follower_topic_id, presence: true
		validates  :topic_added_id,    presence: true

end



