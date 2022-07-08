module ApplicationHelper
  # def logged_in?
  # 	!current_user.nil?
  # end

  def subscribe_user
    customer =  current_user.stripe_id
    customer.present?
  end
end
