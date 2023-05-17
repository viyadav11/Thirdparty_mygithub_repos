class Api::V1::GithubsController < ApplicationController
  def user
    response = RestClient.get(ENV["BASE"]+"#{params[:name]}")
    byebug
    # User.scope
    render json: User.create_user(response)
    proc.call
  end
  proc=Proc.new{p "Hello proc"}
  def repos
    response = RestClient.get(ENV["BASE"]+"#{params[:name]}/repos")
    render json: User.create_repos(response,params[:page])
  end
end
