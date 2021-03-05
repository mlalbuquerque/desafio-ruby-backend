# frozen_string_literal: true

class ApplicationInput < SimpleForm::Inputs::Base
  attr_reader :wrapper_options

  def input(wrapper_options)
    @wrapper_options = wrapper_options || {}

    custom_text_field
  end

  def custom_text_field
    @builder.text_field(custom_attribute_name, new_html_options)
  end

  def custom_attribute_name
    attribute_name
  end

  def new_html_options
    wrapper_options.merge(custom_html_options)
  end

  def custom_html_options
    ch_options = input_options[:input_html] || {}
    ch_options[:class] = "#{ch_options[:class]} #{wrapper_options[:class]}"

    ch_options[:class] += additional_html_classes_options.to_s

    ch_options
  end

  def additional_html_classes_options
    if object_errors_messages[attribute_name].any?
      " #{wrapper_options[:error_class]}"
    elsif object.try("#{attribute_name}_changed?")
      " #{wrapper_options[:valid_class]}"
    end
  end

  def object_errors_messages
    @object_errors_messages ||= object.errors.messages
  end
end
