class Question < ApplicationRecord
  before_save :check
  
  belongs_to :user
  belongs_to :topic
  has_many :answers, dependent: :destroy

  validates :question, presence: true, length: { minimum: 2, maximum: 150 }

  def check
    if  (trans = Transaction.find_by(user_id: self.user_id)).present?
      self.publish = true if trans.payment_status == "paid" 
    end
  end
  
end
