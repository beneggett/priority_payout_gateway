module PriorityPayoutGateway
  class Recurring < Api

    # PriorityPayoutGateway::Recurring.new.create_plan plan_amount: 1.99, plan_name: "Test 1.99", plan_id: "test-1", month_frequency: 1, day_of_month: 1
    def create_plan(options = {})
      query = set_query(options)
      # Vault Info
      query[:recurring] = 'add_plan'
      query[:type] = 'recurring'
      query[:plan_payments] ||= '0'
      require_fields(:plan_amount, :plan_name, :plan_id) # day_frequency, #month_frequency 1-24, # day_of month 1-31
      response = post query
    end


    # PriorityPayoutGateway::Recurring.new.add_subscription_to_plan plan_id: "test-1", customer_vault_id: 664625840
    def add_subscription_to_plan(options = {})
      query = set_query(options)
      query[:recurring] = 'add_subscription'
      query[:type] = 'recurring'
      require_fields(:plan_id) # day_frequency, #month_frequency 1-24, # day_of month 1-31
      response = post query
    end

    # PriorityPayoutGateway::Recurring.new.add_custom_subscription plan_amount: 1.99, month_frequency: 1, day_of_month: 1,  customer_vault_id: 664625840
    def add_custom_subscription(options = {})
      query = set_query(options)
      query[:recurring] = 'add_subscription'
      query[:type] = 'recurring'
      query[:plan_payments] ||= '0'
      require_fields(:plan_payments, :plan_amount) # day_frequency, #month_frequency 1-24, # day_of month 1-31
      response = post query
    end

    # PriorityPayoutGateway::Recurring.new.update_subscription subscription_id: "3261766445", first_name: "John", last_name: "Doe"
    def update_subscription(options = {})
      query = set_query(options)
      query[:recurring] = 'update_subscription'
      query[:type] = 'recurring'
      require_fields(:subscription_id)
      response = post query
    end

    # PriorityPayoutGateway::Recurring.new.delete_subscription subscription_id: "3261766445"
    def delete_subscription(options = {})
      query = set_query(options)
      query[:recurring] = 'delete_subscription'
      query[:type] = 'recurring'
      require_fields(:subscription_id)
      response = post query
    end

  end
end

