class LojaDecorator < ApplicationDecorator
  delegate_all

  def balance
    h.number_to_currency model.balance
  end
end
