ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    panel "Recent Posts" do
        table_for Post.order("created_at desc").limit(5) do
            column :title
            column "Tags", :tag_list
            column "Comments",:comments do |post|
                post.comments.count
            end
        end
    end

    panel "Recent Comments" do
        table_for Comment.order("created_at desc").limit(15) do
            column :name
            column "Comment", :body
            column "Post Title", :post
        end
    end

  end 
end
