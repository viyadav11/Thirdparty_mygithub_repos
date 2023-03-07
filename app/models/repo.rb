class Repo < ApplicationRecord
    belongs_to :user
    validates :Name ,uniqueness: true 
    

end
