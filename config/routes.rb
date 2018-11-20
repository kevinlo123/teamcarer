Rails.application.routes.draw do
   # static pages
   root to: 'pages#home'
   get 'familyPage', to: 'pages#family'
   get 'teamPage', to: 'pages#team'
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
      get 'family/all', to: 'family#allPosts'       
      get 'family/newPost', to: 'family#new'
      post 'family/createPost', to: 'family#create'
      get 'family/recipient', to: 'family#newRecipient'
      post 'family/createRecipient', to: 'family#createRecipient'
      get 'family/editRecipient/:id/edit', to: 'family#editRecipient'  
      patch 'family/updateRecipient/:id', to: 'family#updateRecipient'
      get 'family/teamSearch', to: 'family#teamSearch'  
   end  
   # caregiver dashboard 
   as :team do      
      get 'team', to: 'team#index', as: :team_root   
      get 'team/posts', to: 'team#allPosts' 
      get 'team/myTeam', to: 'team#team'
   end  
end

