# frozen_string_literal: true

class EnableUnaccentExtension < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'unaccent'
  end
end
