class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: { minimum: 10 }
    validates :content, presence: true
    acts_as_taggable

    def publish_now
    end

    scope :unpublished, -> {
    	where(:published_at => nil)
    }
    
    scope :published, ->(logged_in = nil) { 
    	where.not(:published_at => nil) unless logged_in
    }
end
