Rails.application.routes.draw do
   # static pages
   as :static_pages do
      root to: 'pages#home'
      get 'family_page', to: 'pages#family'
      get 'care_giver_page', to: 'pages#care_giver'
      post 'contact', to: 'pages#create', as: :create_message
   end
   # devise for our two users
   devise_for :families, path: 'families', controllers: { sessions: "families/sessions", confirmations: 'families/confirmations', registrations: 'families/registrations'}
   devise_for :care_givers, path: 'care_givers' , controllers: { sessions: "caregivers/sessions", confirmations: 'caregivers/confirmations', registrations: 'caregivers/registrations'}
   # resources
   resources :job_posts
   resources :family_steps
   resources :care_giver_steps
   resources :charges
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
   # caregiver steps
   post 'care_giver_steps/skills_information', to: 'care_giver_steps#update'
   post 'care_giver_steps/disease_management', to: 'care_giver_steps#conditions'
   post 'care_giver_steps/yes_no', to: 'care_giver_steps#yes_no'
   post 'care_giver_steps/personal_statement', to: 'care_giver_steps#personal_statement'
   post 'care_giver_steps/experience', to: 'care_giver_steps#experience'
   get 'states-cg', to: 'care_giver_steps#city'
   # family dashboard
   as :family do
      get 'family', to: 'family#index', as: :family_root
      get 'family/new_post', to: 'family#new_post'
      post 'family/create_post', to: 'family#create_post'
      post 'family/update_recipient_for_post', to: 'family#update_recipient_for_post'
      get 'family/my_posting', to: 'family#my_posting', as: :my_posting
      delete 'family/my_posting/delete/:id', to: 'family#delete_post', as: :delete_post
      get 'family/edit_posting', to: 'family#edit_posting', as: :edit_posting
      post 'family/update_post', to: 'family#update_post'
      get 'family/recipient', to: 'family#recipient'
      get 'family/edit_recipient/:id/edit', to: 'family#edit_recipient'
      patch 'family/update_recipient/:id', to: 'family#update_recipient'
      get 'family/team_search', to: 'family#team_search', as: :search_team
      get 'family/team_search_results', to: 'family#team_search_results', as: :search_team_results
      get 'family/team_search_results_state', to: 'family#team_search_results_state', as: :search_team_results_state
      get 'family/team_search_results_city', to: 'family#team_search_results_city', as: :search_team_results_city
      get 'family/team/:id', to: 'family#team_show', as: :team_show
      get 'family/team_member/:id', to: 'family#team_show_member', as: :team_show_member
      get 'family/team_selection/:id', to: 'family#team_selection', as: :team_selection
      get 'family/my_team/:id', to: 'family#my_team', as: :my_team
      patch 'family/remove_team', to: 'family#remove_team', as: :remove_team
   end
   # caregiver dashboard
   as :team do
      get 'team', to: 'team#index', as: :team_root
      get 'team/posts/:id', to: 'team#all_posts', as: :all_posts
      get 'team/my_team/:id', to: 'team#my_team', as: :my_care_team
      get 'team/remove_member/:id', to: 'team#remove_member', as: :remove_member
      get 'team/new_team', to: 'team#new_team'
      post 'team/create_team', to: 'team#create_team'
      get 'team/join_team', to: 'team#join_team', as: :join_teams
      get 'team/search_results', to: 'team#search_results', as: :team_results
      get 'team/search_results_state', to: 'team#search_results_state', as: :team_results_state
      get 'team/search_results_city', to: 'team#search_results_city', as: :team_results_city
      get 'team/edit_post/:id/edit', to: 'team#edit_post'
      patch 'team/edit_post/:id/update_post', to: 'team#update_post'
      get 'team/show_team/:id', to: 'team#show_team', as: :show_team
      get 'team/team_member/:id', to: 'team#show_member', as: :show_member
      patch '/team/update_team/:id', to: 'team#update_team'
      get 'team/hours/:id', to: 'team#hours', as: :care_hours
      post 'team/create_hours/:id', to: 'team#create_hours', as: :create_hours
   end
end
