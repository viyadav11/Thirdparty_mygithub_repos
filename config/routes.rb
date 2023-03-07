Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/:name",to: 'githubs#user'
      get "/:name/repos",to: 'githubs#repos'
    end
  end
end
