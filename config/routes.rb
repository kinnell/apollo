Apollo::Application.routes.draw do

  devise_for :users
  resources :users, only: [:index, :show]

  resources :products, only: [:index, :edit, :create, :update, :destroy]

  resources :projects, only: [:index, :show, :new, :edit, :create, :update, :destroy] do
    resources :tasks, only: [:index, :show, :new, :edit, :create, :update, :destroy] do
      resources :notes, only: [:index, :new]
    end
    resources :items, only: [:new, :edit, :create, :update, :destroy]
    resources :comments, only: [:index, :new, :edit, :create, :update, :destroy]
  end

  resources :print_jobs, only: [:index, :create, :edit, :update, :destroy]

  authenticated :user do
    root :to => "projects#index", as: :authenticated_root
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  get '/projects', to: "projects#index"
  get '/projects/new', to: "projects#new"

  get '/tasks', to: "tasks#index"

  get "notes/index"
  get "notes/new"

  get '/users', to: "users#index"

  get 'calendar', to: "pages#calendar"
  get 'myCalendar', to: "pages#myCalendar"
  get 'changelog', to: "pages#changelog"

  match '/projects/:id/complete' => "projects#complete", :as => :complete_project, via: [:post]
  match '/projects/:id/uncomplete' => "projects#uncomplete", :as => :uncomplete_project, via: [:post]

  match '/projects/:id/toggle_starred' => "projects#toggle_starred", :as => :toggle_starred_project, via: [:post]

  match '/tasks/:id/toggle_starred' => "tasks#toggle_starred", :as => :toggle_starred_task, via: [:patch]


end
