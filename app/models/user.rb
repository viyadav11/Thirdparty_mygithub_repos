class User < ApplicationRecord
    has_many :repos
    validates :Name ,uniqueness: true
   
    # scope :with_juice, -> { p "scope" }
    def self.create_user(response)
      User.create(Name: JSON.parse(response)['login'])    
    end
    def self.create_repos(response,page)
      userobject=User.find_by(Name:JSON.parse(response).first['owner']['login'])
      JSON.parse(response).each do |repo|
        Repo.create(
          Name: repo["name"],
          Forknumber: repo["forks_count"], 
          Stargazersnumber: repo["stargazers_count"],
          user_id: userobject[:id])

    
      end
      userobject.repos.order(:user_id).page page
    end
end
