# frozen_string_literal: true

class Select2RemoteInput < ApplicationInput
  def custom_text_field
    @builder.select(custom_attribute_name, [], {}, new_html_options)
  end

  def new_html_options
    super.merge(class: 'bs-select2-remote', data: data_html_options)
  end

  def data_html_options
    { url: input_options[:url], entity: input_options[:entity],
      option_key: input_options[:option_key],
      selected_options: object.try(custom_attribute_name) }
  end
end
