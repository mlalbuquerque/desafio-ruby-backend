require 'rails_helper'

RSpec.describe 'arquivos/show', type: :view do
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

  it 'render sha1' do
    render
    expect(rendered).to match(Regexp.escape(arquive.sha1))
  end

  it 'render document name' do
    render
    expect(rendered).to match(Regexp.escape(arquive.documento.blob.filename.to_s))
  end

  it 'render document size' do
    render
    expect(rendered).to match(Regexp.escape(number_to_human_size(arquive.documento.blob.byte_size)))
  end
end
