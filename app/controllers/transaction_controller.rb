class TransactionController < ApplicationController
  def success 
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    Transaction.create!(payment_status: @session.payment_status,transaction_id: @session.id,user_id: current_user.id)
    current_user.questions.each do |question|
      question.publish = true
      question.save
    end
    redirect_to new_question_path
  end 
end
