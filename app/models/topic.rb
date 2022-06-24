class Topic < ApplicationRecord

  belongs_to :user
  has_many :questions, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false },
   length: {minimum: 2,maximum: 50}
    
  has_many :passive_relationships_topic, class_name: "TopicRelation", foreign_key: "topic_added_id", dependent: :destroy
  has_many :followersoftopic, through: :passive_relationships_topic, source: :follower_topic

  # paginates_per 50
end
