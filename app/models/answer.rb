class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :answer, presence: true, length: { minimum: 2, maximum: 600 }
end
