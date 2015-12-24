class Post < ActiveRecord::Base
	acts_as_votable
	
	validates :title, presence:true, length: { minimum: 5 }
	validates :text, presence:true
	validates :category, presence:true
	belongs_to :category

def self.search(search)
    # where(:title, query) -> This would return an exact match of the query
    where("text like ?", "%#{search}%") 
end

end
