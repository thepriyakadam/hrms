module ApplicationHelper

	def class_name
		if action_name == 'new' or action_name == 'create'
			'class: btn btn-primary'
		else
			'class: btn btn-success'
		end
	end

	def data_info
		if action_name == 'new' or action_name == 'create'
			"Saving..."
		else
			"updating..."
		end
	end

end
