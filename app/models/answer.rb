class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

validates :answer, presence: true, uniqueness: { case_sensitive: false },
   length: {minimum: 2,maximum: 400}
    

end
