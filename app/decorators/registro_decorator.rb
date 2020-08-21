class RegistroDecorator < ApplicationDecorator
  delegate_all
  def data
    I18n.l model.data, format: :default
  end

  def hora(zone = 'Buenos Aires')
    I18n.l model.hora.in_time_zone(zone), format: :default
  end

  def value
    h.number_to_currency model.value
  end
end
