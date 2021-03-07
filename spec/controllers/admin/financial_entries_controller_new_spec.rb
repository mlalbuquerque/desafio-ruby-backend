# frozen_string_literal: true

module Admin
  describe FinancialEntriesController do
    include_context 'when user logged', :manager

    let(:model_class) { FinancialEntry }
    let(:model_name) { h.tm(FinancialEntry) }
    let(:financial_entry_field_names) { [:user_id, :content_file] }

    describe 'GET new' do
      before { get :new }

      it 'returns http success' do
        expect(response).to be_successful
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end

      it 'assigns instance of FinancialEntry' do
        expect(assigns(:financial_entry)).to be_a_kind_of(model_class)
      end

      it 'has a page title' do
        expect(response.body).to have_css('h1',
                                          text: h.t('shared.new_title.title',
                                                    model: h.tm(Transaction)))
      end

      it 'has a form' do
        expect(response.body)
          .to have_css('form[action="/admin/financial_entries"]')
      end

      it 'has financial_entry fields in form' do
        financial_entry_field_names.map do |field|
          expect(response.body).to have_field("financial_entry[#{field}]")
        end
      end

      it 'has a link back to financial_entry' do
        expect(response.body)
          .to have_link(t('menu.links.back'), href: admin_root_path)
      end

      it 'has a submit button' do
        expect(response.body)
          .to have_css("input[value='Criar #{model_name}'][name='commit']")
      end
    end
  end
end
