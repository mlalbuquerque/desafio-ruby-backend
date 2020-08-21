class LojasController < ApplicationController
  before_action :set_loja, only: %i[show]

  def index
    @lojas = Loja.all
  end

  def show
    @loja = @loja.decorate
  end

  private

  def set_loja
    @loja = Loja.find(params[:id])
  end
end
