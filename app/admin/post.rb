ActiveAdmin.register Post do
	permit_params :title, :content, :published_at
	scope :unpublished
	scope :published
	scope :all

	index do
		column :title
		column "Post", :content
		column "Tags", :tag_list
		column "Comments",:comments do |post|
			post.comments.count
		end
		column "Created on", :created_at
		column "Updated on", :updated_at
		column "Published", :published_at do |post|
			post.published_at ? "Published" : "Unpublished"
		end
		actions
	end


end
