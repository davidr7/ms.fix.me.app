module Administration::AdministrationHelper

	def category_link(category)
		return '' unless category

		link_to(category.name, administration_category_path(category))
	end

  # Return the plublished status of the object
	def published_status(i)
		ActsAsPublishable::STATUS_NAMES[i]
	end
end
