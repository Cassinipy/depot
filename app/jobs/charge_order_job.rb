class ChargeOrderJob < ApplicationJob
  queue_as :default

  def perform(order, pay_type_params)
    # byebug
    order.charge!(pay_type_params)

  end
end
