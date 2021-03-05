# frozen_string_literal: true

module ControllerHelpers
  def random_uuid
    SecureRandom.uuid
  end

  private

  def helpers
    @helpers ||= ApplicationController.helpers
  end
  alias h helpers

  def translate(*args)
    I18n.t(*args)
  end
  alias t translate

  def json_body
    return if response.body.blank?

    @json_body ||= JSON.parse(response.body, symbolize_names: true)
  end
end
