module PropertiesHelper
	def add_photo_link(name)
		"<a href='#' class='add_photo'>#{name}</a>".html_safe
	end
end
