Rails.application.routes.draw do
  devise_for :admin
  devise_for :users

  scope module: :public do
    root to:'homes#top'
    get 'about'=>"homes#about"
    patch 'users/withdraw/:id', to:'users#withdraw', as:"users/withdraw"
    resources :users,only:[:show,:edit,:update]
    resources :books,only:[:new,:index,:show,:edit,:update,:create,:destroy] do
      resource :favorites,only:[:create,:destroy]
      collection do
        get 'search'
      end
    end
  end

  namespace :admins do
    resources :books,only:[:index,:destroy]
    resources :users,only:[:index,:show,:edit]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
