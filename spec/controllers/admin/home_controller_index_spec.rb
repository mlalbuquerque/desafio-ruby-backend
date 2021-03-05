# frozen_string_literal: true

module Admin
  describe HomeController do
    include_context 'when user logged', :manager

    describe 'GET index' do
      before { get :index }

      it 'returns http success' do
        expect(response).to be_successful
      end

      it 'renders the layout admin' do
        expect(response).to render_template(layout: :admin)
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end

      it 'has a page title' do
        expect(response.body)
          .to have_css('h1', text: t('admin.home.index.title'))
      end
    end
  end
end
