Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'api/check' => 'api#check'
  post 'api/serve_mp3' => 'api#serve_mp3'
end
