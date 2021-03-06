# frozen_string_literal: true

class ImportCNBAFileService < ApplicationService
  attr_reader :financial_entry, :errors

  def initialize(params)
    @financial_entry = FinancialEntry.new(params)
    @errors = []
  end

  def perform
    return self unless financial_entry.save

    file_rows.each do |row|
      service = CNBARowToTransactionService.call(row, financial_entry.user_id)

      @errors << service.errors unless service.success?
    end

    self
  end

  def success?
    financial_entry.persisted? && @errors.empty?
  end

  def file_rows
    @file_rows ||= financial_entry.content_file.lines.map(&:strip)
  end
end
