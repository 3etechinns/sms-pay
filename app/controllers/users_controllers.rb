class UsersController < ApplicationController 
  def create
    phone = params['from']
    body = params['body']

    
    Compropago.api_key = "sk_test_8305a01416373e4b4"

    if body.match('depositar')
      amount = /(\d+)/.match(body)[0]

      charge = Compropago::Charge.create({ product_price: amount,
                                           product_name: "Deposito a #{phone}",
                                           customer_name: "SMS Pay",
                                           customer_email: "noreply@compropago.com",
                                           payment_type: "OXXO"})

      if charge
        User.create(phone: phone)
      end
    end
  end
end