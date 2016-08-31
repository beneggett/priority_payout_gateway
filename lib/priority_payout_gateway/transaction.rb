module PriorityPayoutGateway
  class Transaction < Api

    # PriorityPayoutGateway::Transaction.new.sale ccnumber: '4111111111111111', ccexp: "0219", first_name: "John", last_name: "Doe", amount: 22.30, email: "john@doe.com", country: "US"

    # PriorityPayoutGateway::Transaction.new.sale ccnumber: '4111111111111111', ccexp: "0219", first_name: "John", last_name: "Doe", amount: 22.45, email: "john@doe.com", country: "US", customer_vault: "add_customer"
    def sale(options = {})
      query = set_query(options)
      query[:type] = 'sale'
      require_fields(:first_name, :last_name, :email, :amount) # :ccnumber, :ccexp, :customer_vault_id
      post query
    end

    # PriorityPayoutGateway::Transaction.new.authorize ccnumber: '4111111111111111', ccexp: "0219", first_name: "John", last_name: "Doe", amount: 22.25, email: "john@doe.com", country: "US"
    def authorize(options = {})
      query = set_query(options)
      query[:type] = 'auth'
      require_fields(:first_name, :last_name, :email, :amount ) # :ccnumber, :ccexp,
      post query
    end

    # PriorityPayoutGateway::Transaction.new.capture transactionid: 3261830498, amount: 22.30
    def capture(options = {})
      query = set_query(options)
      query[:type] = 'capture'
      require_fields(:transactionid, :amount )
      post query
    end

    # PriorityPayoutGateway::Transaction.new.void transactionid: 3261830498, amount: 22.30
    def void(options = {})
      query = set_query(options)
      query[:type] = 'void'
      require_fields(:transactionid)
      post query
    end

    # PriorityPayoutGateway::Transaction.new.refund transactionid: 3261844010, amount: 5
    def refund(options = {})
      query = set_query(options)
      query[:type] = 'refund'
      require_fields(:transactionid) # amount
      post query
    end

    # PriorityPayoutGateway::Transaction.new.update transactionid: 3261844010, first_name: "joe"
    def update(options = {})
      query = set_query(options)
      query[:type] = 'update'
      require_fields(:transactionid)
      post query
    end

    # PriorityPayoutGateway::Transaction.new.find transactionid: 3261844010
    def find(options = {})
      query = set_query(options)
      query[:report_type] ||= 'transaction'
      response = get query
    end

    # Disabled for our merchant account
    # PriorityPayoutGateway::Transaction.new.credit ccnumber: '4111111111111111', ccexp: "0219", first_name: "John", last_name: "Doe", amount: 22.30, email: "john@doe.com", country: "US"
    def credit(options = {})
      query = set_query(options)
      query[:type] = 'credit'
      require_fields(:first_name, :last_name, :email, :amount ) # :ccnumber, :ccexp,
      post query
    end

    # Disabled for our merchant account
    # PriorityPayoutGateway::Transaction.new.validate ccnumber: '4111111111111111', ccexp: "0219", first_name: "John", last_name: "Doe",  email: "john@doe.com", country: "US"
    def validate(options = {})
      query = set_query(options)
      query[:type] = 'validate'
      require_fields(:first_name, :last_name, :email) # :ccnumber, :ccexp,
      post query
    end

  end
end
