Rails.application.routes.draw do
  get 'agenda/index', as: 'agenda'
  patch 'agenda/agendar', as: 'agendar'
  patch 'agenda/desmarcar', as: 'desmarcar'

  root 'agenda#index'

  devise_for :users
end
