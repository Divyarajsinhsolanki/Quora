class Question < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :answers, dependent: :destroy

  validates :question, presence: true, uniqueness: { case_sensitive: false },
                       length: { minimum: 2, maximum: 150 }
end
