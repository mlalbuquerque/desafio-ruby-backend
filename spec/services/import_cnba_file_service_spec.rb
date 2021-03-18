# frozen_string_literal: true

describe ImportCNBAFileService do
  setup do
    content_file.each_line do |line|
      next if TransactionKind.exists?(code: line[0])

      create(:transaction_kind, code: line[0])
    end
  end

  subject(:service) { described_class.call(financial_entry_params) }

  let(:user) { create(:user) }
  let(:content_file) { File.open('./CNAB.txt').read }
  let(:financial_entry_params) do
    { user_id: user.id, content_file: content_file }
  end

  describe 'when params invalid' do
    let(:financial_entry_params) { { user_id: nil, content_file: '' } }

    it { is_expected.not_to be_success }

    it { expect(Transaction.count).to eq(0) }
  end

  describe 'when params valid' do
    it { is_expected.to be_success }
  end
end
