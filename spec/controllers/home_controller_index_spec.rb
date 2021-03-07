# frozen_string_literal: true

describe HomeController do
  describe 'GET index' do
    setup { create_list(:transaction, 5) }

    include_context 'when user logged'

    before { get :index }

    let(:assigns_transactions) do
      assigns(:transactions).map do |transaction|
        transaction.extend(ActionView::Helpers::NumberHelper,
                           ::Interage::NumberHelper)
      end
    end

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

    it 'show transaction store_name' do
      assigns_transactions.map do |transaction|
        expect(response.body).to have_content(transaction.store_name)
      end
    end

    it 'show transaction kind_description' do
      assigns_transactions.map do |transaction|
        expect(response.body).to have_content(transaction.kind_description)
      end
    end

    it 'show transaction kind_nature_humanize' do
      assigns_transactions.map do |transaction|
        expect(response.body).to have_content(transaction.kind_nature_humanize)
      end
    end

    it 'show transaction store_responsible_name' do
      assigns_transactions.map do |transaction|
        expect(response.body)
          .to have_content(transaction.store_responsible_name)
      end
    end

    it 'show transaction formatted_amount' do
      assigns_transactions.map do |transaction|
        expect(response.body).to have_content(transaction.formatted_amount)
      end
    end

    it 'show transaction credit_card_number' do
      assigns_transactions.map do |transaction|
        expect(response.body).to have_content(transaction.credit_card_number)
      end
    end

    it 'show transaction customer_ssn' do
      assigns_transactions.map do |transaction|
        expect(response.body).to have_content(transaction.customer_ssn)
      end
    end
  end
end
