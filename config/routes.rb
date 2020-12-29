Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get 'about', to:'welcome#about'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'applyForm', to:'opportunities#applyForm'
  get 'withdraw', to:'opportunities#withdraw'
  get 'showDetails', to:'opportunities#showDetails'
  resources :openings
  resources :opportunities

  resources :openings do
    resources :feedbacks
  end

  resources :userdetails, except: [:delete]
end
