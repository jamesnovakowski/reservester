Rails.application.routes.draw do

  get 'categories/index' => 'categories#index'

  resources :categories


  devise_for :users
  resources :restaurants do
    put :favorite, on: :member
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'restaurants#index'
  
  get 'restaurants/index'

  get 'about' => "pages#about"

end
