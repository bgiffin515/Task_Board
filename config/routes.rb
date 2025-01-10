Rails.application.routes.draw do
  # Set the root route to point to the tasks index page
  root 'tasks#index'

  # Define all the routes for tasks
  resources :tasks
end
