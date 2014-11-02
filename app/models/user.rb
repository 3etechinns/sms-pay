class User < ActiveRecord::Base
  attr_accessor :balance
  has_many :charges
end
