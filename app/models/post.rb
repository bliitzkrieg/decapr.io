class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: { minimum: 10 }
    validates :content, presence: true
    acts_as_taggable

    scope :unpublished, -> {
    	where(:published_at => nil)
    }
    
    scope :published, -> {
    	where.not(:published_at => nil)
    }
end
