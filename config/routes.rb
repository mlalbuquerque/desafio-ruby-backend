Rails.application.routes.draw do
  get 'callback', to: 'sessao#callback'
  get 'entrar', to: 'sessao#entrar'
  get 'sair', to: 'sessao#sair'
  resources :arquivos
  resources :lojas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'arquivos#index'
end
