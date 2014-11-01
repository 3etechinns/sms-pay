class UsersController < ApplicationController 
  def endpoint
    phone = params['From']
    body = params['Body']

    # Usuario deposita dinero
    if body.match('depositar')[0]

      Compropago.api_key = "sk_test_8305a01416373e4b4"
  
      if body.match('depositar')[0]
        amount = /(\d+)/.match(body)[0]
        phone = phone.gsub('+52','')
  
        charge = Compropago::Charge.create({ product_price: amount,
                                             product_name: "Deposito a #{phone}",
                                             customer_name: "SMS Pay",
                                             customer_email: "noreply@compropago.com",
                                             payment_type: "OXXO"})
  
        Compropago::SMS.create(payment_id: charge.payment_id, customer_phone: phone, customer_company_phone: "MOVISTAR")
  
        if charge
          User.create(phone: phone, balance: amount.to_i)
        end
  
        respond_to json: nil, status: 200
      end

    # Usuario solicita su saldo 
    elsif body.match('saldo')[0]
      user = User.find_by_phone(phone: phone.gsub('+52',''))
      client.messages.create(
        from: "+15209993914",
        to: "00521" + phone,
        body: "Tu saldo disponible es de: #{user.balance}"
      )

      respond_to json: nil, status: 200
    end
  end

  def check_balance
    if params['api'] == "true"
      phone = params['From']
      body = params['Body']



end