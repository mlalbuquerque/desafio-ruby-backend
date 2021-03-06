# frozen_string_literal: true

class CNBARowToTransactionSerializer < ApplicationSerializer
  KIND_CODE_KEY = 0
  OCCURRED_DATE_RANGE = (1..8).freeze
  AMOUNT_RANGE = (9..18).freeze
  CUSTOMER_SSH_RANGE = (19..29).freeze
  CREDIT_CARD_NUMBER_RANGE = (30..43).freeze
  OCCURRED_HOUR_RANGE = (42..47).freeze
  STORE_RESPONSIBLE_NAME_RANGE = (48..61).freeze
  STORE_NAME_RANGE = (62..80).freeze

  attribute :kind_code do
    object[KIND_CODE_KEY]
  end

  attribute :customer_ssn do
    object[CUSTOMER_SSH_RANGE]
  end

  attribute :credit_card_number do
    object[CREDIT_CARD_NUMBER_RANGE]
  end

  attribute :store_responsible_name do
    object[STORE_RESPONSIBLE_NAME_RANGE].strip
  end

  attribute :store_name do
    object[STORE_NAME_RANGE].strip
  end

  attribute :occurred_at do
    Time.zone.parse("#{object[OCCURRED_DATE_RANGE]} #{object[OCCURRED_HOUR_RANGE]}")
  end

  attribute :amount do
    object[AMOUNT_RANGE].to_d / 100
  end
end
