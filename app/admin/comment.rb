ActiveAdmin.register Comment, :as => "PostComment" do

	index do
		column :name
		column "Comment", :body
		column "Post Title", :post
		column "Created on", :created_at
		column "Updated on", :updated_at
		actions
	end


end
