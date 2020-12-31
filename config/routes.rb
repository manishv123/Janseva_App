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
  get 'users/:id/makeadmin', to: 'users#makeadmin', :as => "active_user"
  get 'users/:id/removeadmin', to: 'users#removeadmin', :as => "deactive_user"

  get 'approveApplication', to:'opportunities#approveApplication'
  get 'rejectApplication', to:'opportunities#rejectApplication'

  resources :openings
  resources :opportunities

  resources :openings do
    resources :feedbacks
  end

  resources :userdetails, except: [:delete]
end
