# frozen_string_literal: true

class ApplicationEnumeration < EnumerateIt::Base
  def self.sample
    list.sample
  end
end
