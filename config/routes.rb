Rails.application.routes.draw do
   devise_for :families, path: 'families', controllers: { sessions: "families/sessions" } #devise
   devise_for :teams, path: 'teams' , controllers: { sessions: "teams/sessions" } #devise
   root to: 'pages#home'
   get 'familyPage', to: 'pages#family' 
   get 'teamPage', to: 'pages#team'
   as :family do 
      get 'family', to: 'family#index', as: :family_root 
      get 'family/createPost', to: 'family#createPost'  
      get 'family/teamSearch', to: 'family#teamSearch'  
   end  
   as :team do      
      get 'team', to: 'team#index', as: :team_root   
      get 'team/posts', to: 'team#allPosts' 
      get 'team/myTeam', to: 'team#team'
   end  
end

