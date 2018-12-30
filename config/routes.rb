Rails.application.routes.draw do
  root to: 'pages#home'
  get '/learn', to: 'pages#learn', as: :learn_page
  get '/quiz', to: 'pages#quiz', as: :quiz_page
  get '/exam', to: 'pages#exam', as: :exam_page
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
