class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: { minimum: 10 }
    validates :content, presence: true
    acts_as_taggable
end
