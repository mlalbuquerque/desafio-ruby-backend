class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :current_user_authenticated
end
