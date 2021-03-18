# frozen_string_literal: true

shared_context 'when user logged' do |user_type|
  before do
    find_or_create_manager_user if user_type == :manager

    login_user
  end

  def login_user
    request.env['devise.mapping'] = Devise.mappings[:user]

    sign_in current_user
  end

  def current_user
    @current_user ||= User.first || create(:session_user)
  end

  def current_user_id
    @current_user_id ||= current_user.id
  end

  private

  def find_or_create_manager_user
    User.find_by(manager: true) || create(:manager_user)
  end
end
