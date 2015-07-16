module PostsHelper

	def tag_links(tags)
		tags.map { |t| link_to t, tag_path(t) }.join(', ').html_safe
	end

	def get_tag_cloud
		links = []
		tag_cloud Post.tag_counts, %w[s m l] do |tag, css_class|
			links.push(link_to tag.name, tag_path(tag.name), class: css_class)
		end
		links.join(' ').html_safe
	end

	def displayPublished(published_at)
		if current_user && published_at == nil
			" - Not Published"
		end
	end
end
