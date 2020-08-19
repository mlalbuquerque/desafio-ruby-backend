module ApplicationHelper
  def current_user
    Usuario.find(session[:user]) if session[:user]
  rescue StandardError
    session.clear
    nil
  end

  def current_user_authenticated
    redirect_to entrar_path unless current_user
  end

  def url_in
    Api::Google.url_in(request)
  end
end
