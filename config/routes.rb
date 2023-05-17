Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/:name",to: 'githubs#user'
      get "/:name/repos",to: 'githubs#repos'
      resources :githubs do
        get ':name/page/:page', action: :repos, on: :collection
      end
    end
  end

  
end

