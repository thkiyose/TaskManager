Rails.application.routes.draw do
  resources :tasks, only: %i(index new create show)
end
