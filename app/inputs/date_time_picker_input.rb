# frozen_string_literal: true

class DateTimePickerInput < InputGroupInput
  def new_html_options
    super.merge(autocomplete: 'off', data: { bs_datepicker: 'date' })
  end

  def prepend_icon
    'calendar'
  end

  def input_group_append
    @builder.text_field("#{attribute_name}_time",
                        new_html_options.merge(data: { mask: 'time' }))
  end

  def custom_attribute_name
    "#{attribute_name}_at"
  end
end
