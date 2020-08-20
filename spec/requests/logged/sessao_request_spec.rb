require 'rails_helper'

RSpec.describe 'Sessao', type: :request do
  before { allow_any_instance_of(ArquivosController).to receive(:current_user).and_return(true) }

  describe 'GET /sair' do
    it 'returns http success' do
      get sair_path
      expect(response).to redirect_to(entrar_path)
    end
  end

  describe 'GET /callback' do
    it 'returns http success' do
      get callback_path
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'GET /entrar' do
    it 'returns http success' do
      get entrar_path
      expect(response).to have_http_status(:success)
    end
  end
end
