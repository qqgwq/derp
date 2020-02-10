Rails.application.routes.draw do
  devise_for :users, :controller => { registrations: 'registrations'}
  root "posts#index"

  resources :posts, only: [:new, :create, :show] do
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
    resources :comments, only: [:new, :create]
  end
end
