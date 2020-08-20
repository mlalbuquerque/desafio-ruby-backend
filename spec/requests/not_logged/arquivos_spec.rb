require 'rails_helper'

RSpec.describe '/arquivos', type: :request do
  let(:valid_attributes) do
    { sha1: Time.now.to_f }
  end

  let(:invalid_attributes) do
    { invalid: :attributes }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Arquivo.create! valid_attributes
      get arquivos_url
      expect(response).to redirect_to(entrar_path)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      arquivo = Arquivo.create! valid_attributes
      get arquivo_url(arquivo)
      expect(response).to redirect_to(entrar_path)
    end
  end

  describe 'GET /new' do
    it 'redirect to login' do
      get new_arquivo_url
      expect(response).to redirect_to(entrar_path)
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      arquivo = Arquivo.create! valid_attributes
      get edit_arquivo_url(arquivo)
      expect(response).to redirect_to(entrar_path)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Arquivo' do
        post arquivos_url, params: { arquivo: valid_attributes }
        expect(response).to redirect_to(entrar_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Arquivo' do
        post arquivos_url, params: { arquivo: invalid_attributes }
        expect(response).to redirect_to(entrar_path)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { sha1: Time.now.to_f }
      end

      it 'redirects to the arquivo' do
        arquivo = Arquivo.create! valid_attributes
        patch arquivo_url(arquivo), params: { arquivo: new_attributes }
        arquivo.reload
        expect(response).to redirect_to(entrar_path)
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        arquivo = Arquivo.create! valid_attributes
        patch arquivo_url(arquivo), params: { arquivo: invalid_attributes }
        expect(response).to redirect_to(entrar_path)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys redirec to entrar_path' do
      arquivo = Arquivo.create! valid_attributes
      delete arquivo_url(arquivo)
      expect(response).to redirect_to(entrar_path)
    end
  end
end
