class SessaoController < ApplicationController
  skip_before_action :current_user_authenticated, only: %i[entrar callback]

  def callback
    user = loader_user
    session[:user] = user.id
  rescue StandardError
    # try login with invalid params
  ensure
    redirect_to :root
  end

  def sair
    session.clear
    redirect_to :root
  end

  def entrar; end

  private

  def google_auth
    Api::Google.auth(code: params_callback, request: request)
  end

  def loader_user
    auth = google_auth
    info = Api::Google.info(auth)
    Usuario.load_info(info.deep_merge(auth))
  end

  def params_callback
    params.require(:code)
  end
end
