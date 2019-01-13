Rails.application.routes.draw do
   # static pages
   as :static_pages do 
      root to: 'pages#home'
      get 'family_page', to: 'pages#family'
      get 'care_giver_page', to: 'pages#care_giver'
   end
   # devise for our two users
   devise_for :families, path: 'families', controllers: { sessions: "families/sessions", confirmations: 'families/confirmations', registrations: 'families/registrations'}
   devise_for :care_givers, path: 'care_givers' , controllers: { sessions: "caregivers/sessions", confirmations: 'caregivers/confirmations', registrations: 'caregivers/registrations'}
   # resources
   resources :job_posts      
   resources :family_steps   
   resources :care_giver_steps
   # resources :states, only: :new  
   devise_scope :family do
      get 'states', to: 'families/registrations#city'
   end
   devise_scope :care_giver do
      get 'states', to: 'caregivers/registrations#city'
   end
   # family steps recipient
   post 'family_steps/recipient_information', to: 'family_steps#create'
   post 'family_steps/recipient_information_second', to: 'family_steps#care_needs'
   post 'family_steps/recipient_information_third', to: 'family_steps#mobility_quality' 
   post 'family_steps/recipient_information_fourth', to: 'family_steps#conditions' 
   post 'care_giver_steps/skills_information', to: 'care_giver_steps#update'    
   post 'care_giver_steps/disease_management', to: 'care_giver_steps#conditions'
   post 'care_giver_steps/yes_no', to: 'care_giver_steps#yes_no' 
   post 'care_giver_steps/personal_statement', to: 'care_giver_steps#personal_statement'                    
   # family dashboard 
   as :family do 
      get 'family', to: 'family#index', as: :family_root
      get 'family/new_post', to: 'family#new_post'
      post 'family/create_post', to: 'family#create_post'
      post 'family/update_recipient_for_post', to: 'family#update_recipient_for_post'
      get 'family/my_posting', to: 'family#my_posting', as: :my_posting      
      get 'family/edit_posting', to: 'family#edit_posting', as: :edit_posting            
      post 'family/update_post', to: 'family#update_post'      
      get 'family/recipient', to: 'family#recipient'
      post 'family/create_recipient', to: 'family#create_family_recipient'
      get 'family/edit_recipient/:id/edit', to: 'family#edit_recipient'  
      patch 'family/update_recipient/:id', to: 'family#update_recipient'
      get 'family/team_search', to: 'family#team_search', as: :search_team  
      get 'family/team_search_results', to: 'family#team_search_results', as: :search_team_results 
   end  
   # caregiver dashboard 
   as :team do      
      get 'team', to: 'team#index', as: :team_root   
      get 'team/posts', to: 'team#all_posts' 
      get 'team/my_team', to: 'team#my_team'
      get 'team/new_team', to: 'team#new_team'
      post 'team/create_team', to: 'team#create_team' 
      get 'team/join_team', to: 'team#join_team', as: :join_teams
      get 'team/edit_post/:id/edit', to: 'team#edit_post'
      patch 'team/edit_post/:id/update_post', to: 'team#update_post'
      get 'team/show_team/:id', to: 'team#show_team', as: :show_team
      patch '/team/update_team/:id', to: 'team#update_team'      
   end  
end

