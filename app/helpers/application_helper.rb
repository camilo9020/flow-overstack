module ApplicationHelper

	def full_title(page_title= '')
		base_title='FlowOverStack'
		if page_title.empty?
			base_title
		else 
			page_title + '|'+ base_title	
		end
	end

	def markdown(text)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
		return markdown.render(text).html_safe
	end

	def markdown(string)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
		return markdown.render(string.to_s).html_safe
	end

end
