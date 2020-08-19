require 'rails_helper'

RSpec.describe Usuario, type: :model do
  let(:usuario) { create(:usuario) }

  it 'is valid with valid attributes' do
    expect(usuario).to be_valid
  end

  attributes = %i[uid email nome primeiro_nome sobrenome foto token]
  uniq_attributes = %i[uid email token]

  attributes.each do |attribute|
    it "attribute #{attribute} can't be nil" do
      another_user = FactoryBot.build(:usuario, attribute => nil)
      expect(another_user).to be_invalid
    end

    it "attribute #{attribute} can't be blank" do
      expect(FactoryBot.build(:usuario, attribute => '')).to be_invalid
    end
  end

  uniq_attributes.each do |attribute|
    it "attribute #{attribute} can't repeat" do
      another_user = FactoryBot.build(:usuario)
      another_user.send :"#{attribute}=", usuario.send(attribute)
      expect(another_user).to be_invalid
    end
  end

  (attributes - uniq_attributes).each do |attribute|
    it "attribute #{attribute} can repeat" do
      another_user = FactoryBot.build(:usuario)
      another_user.send :"#{attribute}=", usuario.send(attribute)
      expect(another_user).to be_valid
    end
  end
end
