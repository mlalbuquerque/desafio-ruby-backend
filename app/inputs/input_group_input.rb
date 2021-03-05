# frozen_string_literal: true

class InputGroupInput < ApplicationInput
  delegate :tag, :app_icon, :concat, to: :template

  def custom_text_field
    tag :div, class: 'input-group' do
      concat input_group_prepend
      concat super
      concat input_group_append
    end
  end

  def input_group_prepend
    return if prepend_content.blank?

    tag :div, class: 'input-group-prepend' do
      tag :span, prepend_content, class: 'input-group-text'
    end
  end

  def prepend_content
    prepend_icon_content.presence || input_options[:prepend]
  end

  def prepend_icon_content
    app_icon(prepend_icon) if prepend_icon.present?
  end

  def prepend_icon
    input_options[:prepend_icon]
  end

  def input_group_append
    return if append_content.blank?

    tag :div, class: 'input-group-append' do
      tag :span, append_content, class: 'input-group-text'
    end
  end

  def append_content
    append_icon_content.presence || input_options[:append]
  end

  def append_icon_content
    app_icon(append_icon) if append_icon.present?
  end

  def append_icon
    input_options[:append_icon]
  end
end
