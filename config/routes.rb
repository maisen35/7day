Rails.application.routes.draw do

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions",
  }

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :tweets, only: [:destroy]
    resources :contacts, only: [:index, :show]
  end

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions",
  }

  scope module: :public do
    get 'tweets/thanks' => 'tweets#thanks', as: 'thanks'
    get 'search' => 'searches#search'
    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :tweets, only: [:new, :index, :show, :create] do
      resource :likes, only: [:create, :destroy]
    end
  end

  root to: 'homes#top'
  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'



end
