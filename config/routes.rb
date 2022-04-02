Rails.application.routes.draw do

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions",
  }

  namespace :admin do
    get 'search' => 'searches#search'
    resources :users, only: [:index, :show, :edit, :update]
    resources :tweets, only: [:index, :show, :destroy]
    resources :contacts, only: [:index, :show, :update]
  end

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions",
  }

  scope module: :public do
    get 'tweets/thanks' => 'tweets#thanks', as: 'thanks'
    get 'search' => 'searches#search'
    get '/tweet/hashtag/:name' => "tweets#hashtag"
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
  get 'about' => 'homes#about', as: 'about'
  resources :contacts, only: [:new, :create]
  post 'contacts/confirm' =>  'contacts#confirm', as: 'confirm'
  post 'contacts/back' => 'contacts#back', as: 'back'
  get 'done' => 'contacts#done', as: 'done'



end
