StackUnderflow::Application.routes.draw do
  root :to => 'questions#index'
  resources :users,     only:   [:create, :update, :destroy]
  resources :sessions,  only:   [:create, :destroy]
  resources :questions, except: [:new, :edit] do 
    resources :answers,    only:   [:create, :update, :destroy]
  end
  


end
