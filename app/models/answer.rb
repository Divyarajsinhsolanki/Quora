class Answer < ApplicationRecord

    # has_many :pictures,:class_name=> "::Picture"
  
  belongs_to :question
  belongs_to :user

validates :answer, presence: true,    length: {minimum: 2,maximum: 600}
    

end
