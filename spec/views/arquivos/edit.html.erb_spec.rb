require 'rails_helper'

RSpec.describe 'arquivos/edit', type: :view do
  before do
    @arquivo = assign(:arquivo, Arquivo.create!(
                                  sha1: 'MyString'
                                ))
  end

  it 'renders the edit arquivo form' do
    render

    assert_select 'form[action=?][method=?]', arquivo_path(@arquivo), 'post' do
      assert_select 'input[name=?]', 'arquivo[sha1]'
    end
  end
end
