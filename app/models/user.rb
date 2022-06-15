class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :topics , dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy


  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships,  class_name: "Relationship",
                                    foreign_key: "followed_id",
                                    dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower


  has_many :active_relationships_topic, class_name: "TopicRelation",
                                        foreign_key: "follower_topic_id",
                                        dependent: :destroy
  has_many :followingtopic, through: :active_relationships_topic, source: :topic_added
  

has_many :passive_relationships_topic, class_name: "TopicRelation", foreign_key: "topic_added_id", dependent: :destroy
  has_many :followersoftopic, through: :passive_relationships_topic, source: :follower_topic




  def followt(topic)
    puts "l============================="
    followingtopic << topic
  end
 
  def unfollowt(topic)
    followingtopic.delete(topic)
  end

  def followingtopic?(topic)
    followingtopic.include?(topic)
  end


  def follow(other_user)
    puts "l============================="

    following << other_user
  end
 
  def unfollow(other_user)
    following.delete(other_user)
  end
 
  def following?(other_user)
    following.include?(other_user)
  end

end
