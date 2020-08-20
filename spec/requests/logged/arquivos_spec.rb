require 'rails_helper'

RSpec.describe '/arquivos', type: :request do
  let(:first_file) do
    path = Rails.root.join('tmp/f1.txt')
    File.open(path, 'w') { |f| f.write(Time.now.to_f) }
    File.new(path)
  end

  let(:second_file) do
    path = Rails.root.join('tmp/f2.txt')
    File.open(path, 'w') { |f| 3.times { f.write(Time.now.to_f) } }
    File.new(path)
  end

  let(:arquive) do
    arquivo = build(:arquivo)
    arquivo.documento.attach(io: first_file, filename: File.basename(first_file))
    arquivo.sha1_from_tempfile(first_file)
    arquivo.save
    arquivo
  end

  let(:another_arquive) do
    arquivo = build(:arquivo)
    arquivo.documento.attach(io: second_file, filename: File.basename(second_file))
    arquivo.sha1_from_tempfile(second_file)
    arquivo.save
    arquivo
  end

  let(:valid_attributes) { { documento: fixture_file_upload(first_file) } }

  let(:invalid_attributes) { { invalid: :attributes } }

  let(:new_attributes) do
    { documento: fixture_file_upload(second_file) }
  end

  before { allow_any_instance_of(ArquivosController).to receive(:current_user).and_return(true) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get arquivos_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get arquivo_url(arquive)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'redirect to login' do
      get new_arquivo_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      get edit_arquivo_url(arquive)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Arquivo' do
        expect do
          post arquivos_url, params: { arquivo: valid_attributes }
        end.to change(Arquivo, :count).by(1)
      end

      it 'check sha1' do
        post arquivos_url, params: { arquivo: valid_attributes }
        expect(Arquivo.last.sha1).to eq(Digest::SHA1.file(first_file.path).to_s)
      end

      it 'redirects to the created arquivo' do
        post arquivos_url, params: { arquivo: valid_attributes }
        expect(response).to redirect_to(arquivo_url(Arquivo.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Arquivo' do
        expect do
          post arquivos_url, params: { arquivo: invalid_attributes }
        end.to change(Arquivo, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post arquivos_url, params: { arquivo: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      it 'updates the requested arquivo' do
        patch arquivo_url(arquive), params: { arquivo: new_attributes }
        arquive.reload
        expect(arquive.sha1).to eq(Digest::SHA1.file(second_file.path).to_s)
      end

      it 'redirects to the arquivo' do
        patch arquivo_url(arquive), params: { arquivo: new_attributes }
        arquive.reload
        expect(response).to redirect_to(arquivo_url(arquive))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch arquivo_url(arquive), params: { arquivo: invalid_attributes }
        expect(response).to redirect_to(Arquivo.last)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested arquivo' do
      arquive
      expect do
        delete arquivo_url(arquive)
      end.to change(Arquivo, :count).by(-1)
    end

    it 'redirects to the arquivos list' do
      delete arquivo_url(arquive)
      expect(response).to redirect_to(arquivos_url)
    end
  end
end
