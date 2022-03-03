Rails.application.routes.draw do
  devise_for :admin,skip: [:registrations,  :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:destroy]
  end

  devise_for :users,skip: [:passwords], controllers: {
    regstrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :posts, only: [:new, :index, :create] do
      resource :likes, only: [:create, :destroy]
    end
  end

  root to: 'homes#top'



end
