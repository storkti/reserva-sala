Rails.application.routes.draw do
  get 'agenda/index'
  patch 'agenda/agendar'
  patch 'agenda/desmarcar'

  root 'agenda#index'

  devise_for :users
end
