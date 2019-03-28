Rails.application.routes.draw do
  post 'evaluation/evaluate'
  resources :instructors
  resources :evaluations
  resources :curriculums
  resources :grades
  resources :students do 
    collection { post :import}
  end
  resources :admins
  root 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
