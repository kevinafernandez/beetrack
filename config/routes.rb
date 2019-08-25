Rails.application.routes.draw do
  root to: redirect('/show')
  get '/show', to: 'vehicles#show'

  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      post 'gps', to: 'waypoints#create'
    end
  end

end
