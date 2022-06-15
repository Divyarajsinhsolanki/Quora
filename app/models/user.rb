  class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :topics , dependent: :destroy
has_many :questions, dependent: :destroy
has_many :answers, dependent: :destroy


  has_many :received_follows, foreign_key: :followed_user_id, class_name: "Relationship"
  has_many :followers, through: :received_follows, source: :follower

  has_many :given_follows, foreign_key: :follower_id, class_name: "Relationship"
  has_many :followings, through: :given_follows, source: :followed_user


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
