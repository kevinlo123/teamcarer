Rails.application.routes.draw do
   devise_for :families, path: 'families', controllers: { sessions: "families/sessions" }
   devise_for :teams, path: 'teams' , controllers: { sessions: "teams/sessions" }
   root to: 'pages#home'
   get 'familyPage', to: 'pages#family'
   get 'teamPage', to: 'pages#team'  
   get 'family', to: 'family#index', as: :family_root
   get 'family/createPost', to: 'family#createPost'  
   get 'family/teamSearch', to: 'family#teamSearch'    
end
