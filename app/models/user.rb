class User < ActiveRecord::Base

  has_many :charges


  def self.update_balance amount, phone
    u = User.where(phone: phone).first
    puts u.inspect
    if u
      u.balance = amount
      if u.save
        puts u.inspect
      else
        puts u.errors.full_messages
      end
    else
      User.create(phone: phone, balance: amount)
    end
  end
end
