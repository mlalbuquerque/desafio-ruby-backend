# frozen_string_literal: true

class ApplicationService
  def self.call(*args)
    new(*args).perform
  end
end
