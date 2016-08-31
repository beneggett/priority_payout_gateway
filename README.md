[![Gem Version](https://badge.fury.io/rb/priority_payout_gateway.svg)](https://badge.fury.io/rb/priority_payout_gateway)

# Priority Payout Gateway

This gem implements the Priority Payout Gateway (NMI) Direct Post & Query API sets as documented here: https://secure.prioritypayoutgateway.com/merchants/resources/integration/integration_portal.php

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'priority_payout_gateway'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install priority_payout_gateway

## Usage

Set your username & password in an environment variable in your application or in a `.env` file directly from the gem:
```
PPG_USERNAME = my_user
PPG_PASSWORD = my_pass
```

There are three API sets:

### Transaction
Sale
```
PriorityPayoutGateway::Transaction.new.sale ccnumber: '4111111111111111', ccexp: "0219", first_name: "John", last_name: "Doe", amount: 22.30, email: "john@doe.com", country: "US"
```

Authorize
```
PriorityPayoutGateway::Transaction.new.authorize ccnumber: '4111111111111111', ccexp: "0219", first_name: "John", last_name: "Doe", amount: 22.25, email: "john@doe.com", country: "US"
```

Capture
```
PriorityPayoutGateway::Transaction.new.capture transactionid: 3261830498, amount: 22.30
```

Void
```
PriorityPayoutGateway::Transaction.new.void transactionid: 3261830498, amount: 22.30
```

Refund
```
PriorityPayoutGateway::Transaction.new.refund transactionid: 3261844010, amount: 5
```

Update
```
PriorityPayoutGateway::Transaction.new.update transactionid: 3261844010, first_name: "joe"
```

Find Implements Query Api -
```
PriorityPayoutGateway::Transaction.new.find transactionid: 3261844010
```

Credit
```
PriorityPayoutGateway::Transaction.new.credit ccnumber: '4111111111111111', ccexp: "0219", first_name: "John", last_name: "Doe", amount: 22.30, email: "john@doe.com", country: "US"
```

Validate
```
PriorityPayoutGateway::Transaction.new.validate ccnumber: '4111111111111111', ccexp: "0219", first_name: "John", last_name: "Doe",  email: "john@doe.com", country: "US"
```

### Customer Vault
Create
```
PriorityPayoutGateway::CustomerVault.new.create ccnumber: '4111111111111111', ccexp: "0219", first_name: "John", last_name: "Doe"
```

Update
```
PriorityPayoutGateway::CustomerVault.new.update customer_vault_id: 481397475, ccnumber: '4111111111111111', ccexp: "0220", first_name: "Jane", last_name: "Doe"
```

Destroy
```
PriorityPayoutGateway::CustomerVault.new.destroy customer_vault_id: 481397475
```

Find Implements Query Api -
```
PriorityPayoutGateway::CustomerVault.new.find customer_vault_id: 481397475
```


### Recurring
Create Plan
```
PriorityPayoutGateway::Recurring.new.create_plan plan_amount: 1.99, plan_name: "Test 1.99", plan_id: "test-1", month_frequency: 1, day_of_month: 1
```

Add Subscription To Plan
```
PriorityPayoutGateway::Recurring.new.add_subscription_to_plan plan_id: "test-1", customer_vault_id: 664625840
```

Add Custom Subscription
```
PriorityPayoutGateway::Recurring.new.add_custom_subscription plan_amount: 1.99, month_frequency: 1, day_of_month: 1,  customer_vault_id: 664625840
```

Update Subscription
```
PriorityPayoutGateway::Recurring.new.update_subscription subscription_id: "3261766445", first_name: "John", last_name: "Doe"
```

Delete Subscription
```
PriorityPayoutGateway::Recurring.new.delete_subscription subscription_id: "3261766445"
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/beneggett/priority_payout_gateway.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

