class UsersController < ApplicationController 
  def create
    phone = params['From']
    body = params['Body']

    
    Compropago.api_key = "sk_test_8305a01416373e4b4"

    if body.match('depositar')[0]
      amount = /(\d+)/.match(body)[0]
      phone = phone.gsub('+52','')

      puts amount
      puts phone

      charge = Compropago::Charge.create({ product_price: amount,
                                           product_name: "Deposito a #{phone}",
                                           customer_name: "SMS Pay",
                                           customer_email: "noreply@compropago.com",
                                           payment_type: "OXXO"})
      puts charge

      Compropago::SMS.create(payment_id: charge.payment_id, customer_phone: phone, customer_company_phone: "MOVISTAR")

      if charge
        User.create(phone: phone)
      end

      render nil
    end
  end
end