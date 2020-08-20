require 'rails_helper'

RSpec.describe 'arquivos/edit', type: :view do
  let(:first_file) do
    path = Rails.root.join('tmp/f1.txt')
    File.open(path, 'w') { |f| f.write Time.now.to_f }
    File.new(path)
  end

  let(:arquive) do
    arquivo = build(:arquivo)
    arquivo.documento.attach(io: first_file, filename: File.basename(first_file))
    arquivo.sha1_from_tempfile(first_file)
    arquivo.save
    arquivo
  end

  before { assign(:arquivo, arquive) }

  it 'renders the edit arquivo form' do
    render
    assert_select 'form[action=?][method=?]', arquivo_path(arquive), 'post' do
      assert_select 'input[name=?]', 'arquivo[documento]'
    end
  end
end
