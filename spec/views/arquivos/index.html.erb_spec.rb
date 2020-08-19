require 'rails_helper'

RSpec.describe 'arquivos/index', type: :view do
  before do
    assign(:arquivos, [
             Arquivo.create!(
               sha1: 'Sha1'
             ),
             Arquivo.create!(
               sha1: 'Sha1'
             )
           ])
  end

  it 'renders a list of arquivos' do
    render
    assert_select 'tr>td', text: 'Sha1'.to_s, count: 2
  end
end
