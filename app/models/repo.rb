class Repo < ApplicationRecord
    paginates_per 3
    belongs_to :user
    validates :Name ,uniqueness: true 
    

end
