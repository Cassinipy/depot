class PayType < ApplicationRecord
  has_many :orders, dependent: :destroy
  validates :pay_type, presence: true
  # def pay_type_keys
  #   pay_types = []
  #   PayType.select(:pay_type).all.to_a.each { |i| pay_types << i.pay_type}
  #   return pay_types
  # end
end
