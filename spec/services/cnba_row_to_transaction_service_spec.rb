# frozen_string_literal: true

describe CNBARowToTransactionService do
  setup { create(:transaction_kind, code: random_line[0]) }

  subject(:service) { described_class.call(random_line, user_id) }

  let(:financial_entry) do
    create(:financial_entry, content_file: File.open('./CNAB.txt').read)
  end
  let(:content_file) { financial_entry.content_file }
  let(:random_line) { content_file.lines.sample.to_s.strip }
  let(:user_id) { financial_entry.user_id }

  describe 'when row invalid' do
    let(:financial_entry) { build(:invalid_financial_entry) }

    it { is_expected.not_to be_success }

    it { expect(Transaction.count).to eq(0) }
  end

  describe 'when row valid' do
    it { is_expected.to be_success }
  end
end
