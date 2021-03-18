# frozen_string_literal: true

module Admin
  class BaseController < ::AuthController
    before_action :check_user_manager!

    layout 'admin'

    private

    def check_user_manager!
      redirect_to root_path unless current_user.manager?
    end
  end
end
