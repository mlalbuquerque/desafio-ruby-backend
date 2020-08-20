require 'rails_helper'

RSpec.describe 'arquivos/index', type: :view do
  let(:first_file) do
    path = Rails.root.join('tmp/f1.txt')
    File.open(path, 'w') { |f| f.write Time.now.to_f }
    File.new(path)
  end

  let(:first_arquive) do
    arquivo = build(:arquivo)
    arquivo.documento.attach(io: first_file, filename: File.basename(first_file))
    arquivo.sha1_from_tempfile(first_file)
    arquivo.save
    arquivo
  end

  let(:second_file) do
    path = Rails.root.join('tmp/f2.txt')
    File.open(path, 'w') { |f| 3.times { f.write(Time.now.to_f) } }
    File.new(path)
  end

  let(:second_arquive) do
    arquivo = build(:arquivo)
    arquivo.documento.attach(io: second_file, filename: File.basename(second_file))
    arquivo.sha1_from_tempfile(second_file)
    arquivo.save
    arquivo
  end

  before { assign(:arquivos, [first_arquive, second_arquive]) }

  it 'renders a list of arquivos' do
    render
    [first_arquive, second_arquive].each do
      assert_select 'tr>td', text: first_arquive.sha1, count: 1
    end
  end
end
