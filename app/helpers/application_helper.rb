# frozen_string_literal: true

module ApplicationHelper
  include ::Interage::ApplicationHelper

  # ::Interage::FlashMessageHelper
  ALIAS_TYPES = { notice: 'success', alert: 'info' }.freeze

  def handle_type(type)
    ALIAS_TYPES[type] || type
  end

  def translate_model_name(model, count = 1)
    model.model_name.human(count: count)
  end
  alias tm translate_model_name
end
