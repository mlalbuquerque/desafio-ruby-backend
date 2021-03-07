# frozen_string_literal: true

module Admin
  describe FinancialEntriesController do
    include_context 'when user logged', :manager

    let(:current_class) { FinancialEntry }

    describe 'POST create' do
      before { post :create, params: financial_entry_params }

      context 'when params is invalid' do
        let(:financial_entry_params) do
          { financial_entry: { user_id: nil } }
        end
        let(:attributes_with_errors) { [:user, :content_file] }

        it 'assigns instance of Order' do
          expect(assigns(:financial_entry)).to be_instance_of(current_class)
        end

        it 'renders the new template' do
          expect(response).to render_template(:new)
        end

        it 'has key errors' do
          attributes_with_errors.map do |attribute|
            expect(assigns(:financial_entry).errors).to have_key(attribute)
          end
        end
      end

      context 'when params is valid' do
        let(:user) { create(:user) }
        let(:financial_entry_attributes) do
          attributes_for(:financial_entry, user_id: user.id)
        end
        let(:financial_entry_params) do
          tempfile = financial_entry_attributes[:content_file].tempfile
          codes = File.open(tempfile).read.lines.map(&:strip).map do |line|
            line[0]
          end
          codes.uniq.map { |code| create(:transaction_kind, code: code) }

          { financial_entry: financial_entry_attributes }
        end

        it 'returns http found' do
          expect(response).to have_http_status(:found)
        end

        it 'returns to listing' do
          expect(response).to redirect_to(admin_root_path)
        end

        it 'flash message setted' do
          expect(flash[:success]).to eq t('controllers.create.success')
        end
      end
    end
  end
end
