module PriorityPayoutGateway
  class CustomerVault < Api

    # PriorityPayoutGateway::CustomerVault.new.create ccnumber: '4111111111111111', ccexp: "0219", first_name: "John", last_name: "Doe"
    def create(options = {})
      query = set_query(options)
      query[:customer_vault] = 'add_customer'

      require_fields(:ccnumber, :ccexp)
      response = post query
    end

    # PriorityPayoutGateway::CustomerVault.new.update customer_vault_id: 481397475, ccnumber: '4111111111111111', ccexp: "0220", first_name: "Jane", last_name: "Doe"
    def update(options = {})
      query = set_query(options)
      query[:customer_vault] = 'update_customer'
      require_fields(:customer_vault_id)
      response = post query
    end

    # PriorityPayoutGateway::CustomerVault.new.destroy customer_vault_id: 481397475
    def destroy(options = {})
      query = set_query(options)
      query[:customer_vault] = 'delete_customer'
      require_fields(:customer_vault_id)
      response = post query
    end

    # PriorityPayoutGateway::CustomerVault.new.find customer_vault_id: 481397475
    def find(options = {})
      query = set_query(options)
      query[:report_type] = 'customer_vault'
      require_fields(:customer_vault_id)
      response = get query
    end

  end
end
