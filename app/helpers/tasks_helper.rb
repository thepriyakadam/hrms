module TasksHelper
	def all_task
		Task.all.collect { |x| [x.name, x.id] }
	end
end
