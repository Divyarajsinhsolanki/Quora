# This file contains descriptions of all your stripe prices

# Example
# Stripe::Prices::LITE.lookup_key #=> 'lite'

# Prices will have a stripe generated id.  The lookup_key will match the
# configuration below.  You can fetch the ID or object from stripe:
#
#    Stripe::Prices::LITE.stripe_id #=> 'price_0000sdfs2qfsdf'
#    Stripe::Prices::LITE.stripe_object #=> #<Stripe::Price:0x3584 id=price_0000sdfs2qfsdf>...

# Prices are not deletable via the API, the `reset!` method will instead
# create a new price and transfer the lookup key to the new price.

# Stripe.price :Qoura do |price|
#   # Prices may belong to a product, this will create a product along with the price
#   price.name = 'Qoura'

#   # You can also specify an existing product ID
#   # price.product_id = Stripe::Products::PRIMO.id

#   # amount in cents. This is 6.99
#   price.unit_amount = 200

#   # currency to use for the price (default 'usd')
#   price.currency = 'usd'

#   price.recurring = {
#     # interval must be either 'day', 'week', 'month' or 'year'
#     interval: 'week',
#     # only bill once every three months (default 1)
#     interval_count: 3,
#     # Must be either 'metered' or 'licensed'
#     usage_type: 'metered',
#     # Specifies a usage aggregation strategy for metered usage
#     aggregate_usage: 'sum'
#   }

# end

Stripe.price :bronze do |price|
    # Use an existing product id to prevent a new product from
    # getting created
    price.product_id = Stripe::Products::PRIMO.id
    price.billing_scheme = 'tiered'
    price.recurring = {
      interval: 'month',
      usage_type: 'metered'
    }
  
    # Use graduated pricing tiers
    # ref: https://stripe.com/docs/api/prices/object#price_object-tiers
    price.tiers = [
      {
        unit_amount: 1500,
        up_to: 10
      },
      {
        unit_amount: 1000,
        up_to: 'inf'
      }
    ]
    price.tiers_mode = 'graduated'
  end

  
# Once you have your prices defined, you can run
#
#   
#
# This will export any new prices to stripe.com so that you can
# begin using them in your API calls.
