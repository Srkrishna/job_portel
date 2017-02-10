Rails.application.routes.draw do

  devise_for :users
  root to: 'home#index'
  get 'home/create'
  get 'requested_jobs/create_job'
  resources :company_details
  resources :job_posts
  resources :requested_jobs
  resources :experiences
  resources :education_qualifications
  resources :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
