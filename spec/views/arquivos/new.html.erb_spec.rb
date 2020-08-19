require 'rails_helper'

RSpec.describe 'arquivos/new', type: :view do
  before do
    assign(:arquivo, Arquivo.new(
                       sha1: 'MyString'
                     ))
  end

  it 'renders new arquivo form' do
    render

    assert_select 'form[action=?][method=?]', arquivos_path, 'post' do
      assert_select 'input[name=?]', 'arquivo[sha1]'
    end
  end
end
