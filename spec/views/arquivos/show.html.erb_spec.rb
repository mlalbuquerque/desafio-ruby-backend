require 'rails_helper'

RSpec.describe 'arquivos/show', type: :view do
  before do
    @arquivo = assign(:arquivo, Arquivo.create!(
                                  sha1: 'Sha1'
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Sha1/)
  end
end
