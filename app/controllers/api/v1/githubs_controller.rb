class Api::V1::GithubsController < ApplicationController
  def user
    response=RestClient.get(ENV["BASE"]+"#{params[:name]}")
    render json: User.create_user(response)
  end
  
  def repos
    response=RestClient.get(User::BASE+"#{params[:name]}/repos")
    render json: User.create_repos(response)
  end
end
