Gobus::Application.routes.draw do
  root to: "pages#show"
  get '/location/:coords', to: 'locations#index', via: 'get'
end
