# Rails.configuration.stripe = {
#     :publishable_key => ENV['PUBLISHABLE_KEY'],
#     :secret_key      => ENV['SECRET_KEY']
#   }

#   Stripe.api_key = Rails.configuration.stripe[:secret_key]

# if Rails.env == 'production'
#     Rails.configuration.stripe = {
#       :publishable_key => MY_PUBLISHABLE_KEY,
#       :secret_key      => MY_SECRET_KEY
#     }
#   else
#     Rails.configuration.stripe = {
#       :publishable_key => TEST_MY_PUBLISHABLE_KEY,
#       :secret_key      => TEST_MY_SECRET_KEY
#     }
#   end

#   Stripe.api_key = Rails.configuration.stripe[:secret_key]
