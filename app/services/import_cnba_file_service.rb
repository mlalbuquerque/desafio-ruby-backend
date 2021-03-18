# frozen_string_literal: true

class ImportCNBAFileService < ApplicationService
  attr_reader :financial_entry, :errors

  def initialize(params)
    @financial_entry = FinancialEntry.new(params)
    @errors = []
  end

  def perform
    return self unless financial_entry.save

    financial_entry.content_file.each_line do |line|
      service = CNBARowToTransactionService.call(line, financial_entry.user_id)

      @errors << service.errors unless service.success?
    end

    self
  end

  def success?
    financial_entry.persisted? && @errors.empty?
  end
end
