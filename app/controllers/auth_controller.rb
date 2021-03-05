# frozen_string_literal: true

class AuthController < ApplicationController
  before_action :authenticate_user!
end
