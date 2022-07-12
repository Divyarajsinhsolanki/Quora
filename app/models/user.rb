class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # has_many :pictures,:class_name=> "::Picture"

  # attr_accessor :current_password

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email,    presence: true, length: { minimum: 2, maximum: 50 }
  # validates :password, presence: true, length: { minimum: 6 }

  validates :firstname, presence: true, length: { minimum: 2, maximum: 50 }
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }

  has_many :topics, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :transactions
  has_one_attached :avatar
  has_many_attached :photos

  has_many :active_relationships, class_name: 'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships,  class_name: 'Relationship',
                                    foreign_key: 'followed_id',
                                    dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :active_relationships_topic, class_name: 'TopicRelation',
                                        foreign_key: 'follower_topic_id',
                                        dependent: :destroy
  has_many :followingtopic, through: :active_relationships_topic, source: :topic_added

  def followt(topic)
    followingtopic << topic
  end

  def unfollowt(topic)
    followingtopic.delete(topic)
  end

  def followingtopic?(topic)
    followingtopic.include?(topic)
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
