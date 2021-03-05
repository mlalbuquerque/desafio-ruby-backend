# frozen_string_literal: true

module ApplicationHelper
  include ::Interage::ApplicationHelper

  # ::Interage::FlashMessageHelper
  ALIAS_TYPES = { notice: 'success', alert: 'info' }.freeze

  def handle_type(type)
    ALIAS_TYPES[type] || type
  end
end
