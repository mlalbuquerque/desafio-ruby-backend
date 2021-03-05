# frozen_string_literal: true

class DatePickerInput < InputGroupInput
  def new_html_options
    super.merge(autocomplete: 'off', data: { bs_datepicker: 'date' })
  end

  def prepend_icon
    'calendar'
  end
end
