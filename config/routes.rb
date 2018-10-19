Rails.application.routes.draw do
  devise_for :families, path: 'families', controllers: { sessions: "families/sessions" }
  devise_for :teams, path: 'teams' , controllers: { sessions: "teams/sessions" }
  root to: 'pages#home'
  get 'family', to: 'pages#family'
  get 'team', to: 'pages#team'  
end
