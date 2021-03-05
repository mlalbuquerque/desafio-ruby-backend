# frozen_string_literal: true

class TagInput < ApplicationInput
  delegate :tag, :app_icon_text, :concat, to: :template

  def new_html_options
    super.merge(autocomplete: 'off',
                value: handled_value,
                data: { bootstrap: 'input-tags' })
  end

  def handled_value
    return current_value.join(',') if current_value.is_a?(Array)

    current_value
  end

  def current_value
    @builder.object.try(custom_attribute_name)
  end

  def custom_text_field
    tag :div do
      concat super
      concat custom_hint
    end
  end

  def custom_hint
    tag :div, class: 'text-muted' do
      text_hint
    end
  end

  def text_hint
    app_icon_text('info', 'Separado por virgulas')
  end
end
