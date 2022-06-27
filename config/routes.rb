Rails.application.routes.draw do
  root 'home#homepage'
  get 'about', to: 'pages#about'
end
