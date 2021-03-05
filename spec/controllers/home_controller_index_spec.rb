# frozen_string_literal: true

describe HomeController do
  describe 'GET index' do
    before { get :index }

    it 'returns http success' do
      expect(response).to be_successful
    end

    it 'renders the layout application' do
      expect(response).to render_template(layout: :application)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'has a page title' do
      expect(response.body).to have_css('h1', text: t('home.index.title'))
    end
  end
end
