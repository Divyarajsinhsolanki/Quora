class BillingController < ApplicationController
  def success
    @plans = Stripe::Plan.list.data
  end

  def subscribe
    plan_id = params[:plan_id]
    @subscription = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        name: 'Question Posting',
        amount: 999,
        currency: 'inr',
        quantity: 1
      }],
      mode: 'payment',
      success_url: transaction_success_url + "?session_id={CHECKOUT_SESSION_ID}" ,
      cancel_url: root_url
    })
   redirect_to @subscription.url, allow_other_host: true
  end
end
