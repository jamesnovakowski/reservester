Rails.application.routes.draw do
  get 'reviews/add'

  get 'reviews/update'

  get 'reviews/delete'

  get 'favorites/add'

  get 'favorites/remove'

  devise_for :users
  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'restaurants#index'
  
  get 'restaurants/index'

  get 'about' => "pages#about"

end
