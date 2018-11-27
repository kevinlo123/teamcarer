Rails.application.routes.draw do
   # static pages
   as :static_pages do 
      root to: 'pages#home'
      get 'family_page', to: 'pages#family'
      get 'team_page', to: 'pages#team'
   end
   # devise for our two users
   devise_for :families, path: 'families', controllers: { sessions: "families/sessions", confirmations: 'families/confirmations', registrations: 'families/registrations'} 
   devise_for :teams, path: 'teams' , controllers: { sessions: "teams/sessions", confirmations: 'teams/confirmations', registrations: 'teams/registrations' } 
   # resources
   resources :job_posts      
   resources :family_steps   
   resources :team_steps
   # family steps recipient
   post 'family_steps/recipient_information', to: 'family_steps#create'
   post 'family_steps/recipient_information_second', to: 'family_steps#update'     
   # family dashboard 
   as :family do 
      get 'family', to: 'family#index', as: :family_root
      get 'family/my_posting', to: 'family#my_posting'      
      get 'family/all_posts', to: 'family#all_posts'       
      get 'family/new_post', to: 'family#new_post'
      post 'family/create_post', to: 'family#create_post'
      get 'family/recipient', to: 'family#recipient'
      post 'family/create_recipient', to: 'family#create_family_recipient'
      get 'family/edit_recipient/:id/edit', to: 'family#edit_recipient'  
      patch 'family/update_recipient/:id', to: 'family#update_recipient'
      get 'family/team_search', to: 'family#team_search'  
   end  
   # caregiver dashboard 
   as :team do      
      get 'team', to: 'team#index', as: :team_root   
      get 'team/posts', to: 'team#all_posts' 
      get 'team/my_team', to: 'team#my_team'
      get 'team/new_team', to: 'team#new_team'
      post 'team/create_team', to: 'team#create_team' 
      get 'team/join_team', to: 'team#join_team'
      get 'team/edit_post/:id/edit', to: 'team#edit_post'
      patch 'team/edit_post/:id/update_post', to: 'team#update_post'
      get 'team/show_team/:id', to: 'team#show_team' 
      patch '/team/update_team/:id', to: 'team#update_team'      
   end  
end

