# frozen_string_literal: true

shared_context 'when feature user logged' do |user_type|
  before do
    login_as(find_or_create_user(user_type), scope: :user)
  end

  def find_or_create_user(user_type)
    if user_type == :manager
      User.find_by(manager: true) || create(:manager_user)
    else
      User.find_by(manager: false) || create(:session_user)
    end
  end
end
