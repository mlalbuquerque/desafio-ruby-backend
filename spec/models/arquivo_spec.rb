require 'rails_helper'

RSpec.describe Arquivo, type: :model do
  let(:first_file) do
    path = Rails.root.join('tmp/f1.txt')
    File.open(path, 'w') { |f| f.write Time.now.to_f }
    File.new(path)
  end

  let(:second_file) do
    path = Rails.root.join('tmp/f2.txt')
    File.open(path, 'w') { |f| 3.times { f.write Time.now.to_f } }
    File.new(path)
  end

  it 'cant create with a sha1 nil' do
    arquivo = build(:arquivo)
    arquivo.documento.attach(io: first_file, filename: File.basename(first_file))
    expect(arquivo).to be_invalid
  end

  it 'set sha1' do
    arquivo = build(:arquivo)
    arquivo.documento.attach(io: first_file, filename: File.basename(first_file))
    arquivo.sha1_from_tempfile(first_file)
    arquivo.save
    expect(arquivo.sha1).to eq(Digest::SHA1.file(first_file.path).to_s)
  end

  context 'when try repeat a file' do
    let(:arquive) do
      arquivo = build(:arquivo)
      arquivo.documento.attach(io: first_file, filename: File.basename(first_file))
      arquivo.sha1_from_tempfile(first_file)
    end

    let(:another_arquive_same_file) do
      arquivo = build(:arquivo)
      arquivo.documento.attach(io: first_file, filename: File.basename(first_file))
      arquivo.sha1_from_tempfile(first_file)
    end

    it 'save a arquive' do
      expect(arquive.save).to be true
    end

    it 'cant repeat a save a arquive' do
      arquive.save
      expect(another_arquive_same_file).to be_invalid
    end
  end

  context 'when saving multiple files' do
    let(:arquive) do
      arquivo = build(:arquivo)
      arquivo.documento.attach(io: first_file, filename: File.basename(first_file))
      arquivo.sha1_from_tempfile(first_file)
    end

    let(:another_arquive_another_file) do
      arquivo = build(:arquivo)
      arquivo.documento.attach(io: second_file, filename: File.basename(second_file))
      arquivo.sha1_from_tempfile(second_file)
    end

    it 'save another arquive with another file' do
      arquive.save
      expect(another_arquive_another_file.save).to be true
    end
  end
end
