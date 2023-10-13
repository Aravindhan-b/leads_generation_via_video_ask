Rails.application.routes.draw do

  resources :generate_leads, only: [:create]
  get '/generate_leads/admin', to: 'generate_leads#admin'
  get '/generate_leads/get_contact_details', to: 'generate_leads#get_contact_details'
end

