class_line = ""
before_action = ""
all_line = ""
new_line = ""
create_new_line = ""
if_save = ""
if_update = ""
if_destroy = ""
def_set = ""
set_line = ""
def_param = ""
param_line = ""


Dir.chdir(ARGV[0]) do
f = File.new(ARGV[1],"r").each_with_index do |line,i|
	case i
	when 0
		class_line = line
	when 1
		before_action = line
	when 6
		all_line = line
	when 16
		new_line = line
	when 26
		create_new_line = line
	when 29
		if_save = line
	when 43
		if_update = line
	when 56
		if_destroy = line
	when 65
		def_set = line
	when 66
		set_line = line
	when 70
		def_param = line
	when 71
		param_line = line
	end

# puts i
# puts line

end

ff = File.new("new.rb","w+")
ff.puts class_line
before_action.slice! ":show, "
ff.puts before_action
ff.puts "\n"

ff.puts "  def index"
ff.puts all_line
ff.puts new_line
ff.puts "  end"
ff.puts "\n"

ff.puts "	def create"
ff.puts create_new_line
ff.puts "		"+if_save.strip!
ff.puts "	"+new_line
ff.puts "	"+all_line
ff.puts "			@flag = true"
ff.puts "		else"
ff.puts "			@flag = false"
ff.puts "		end"
ff.puts "	end"
ff.puts "\n"

ff.puts "	def edit"
ff.puts "	end"
ff.puts "\n"

ff.puts "	def update"
ff.puts "		"+if_update.strip!
ff.puts " "+new_line
ff.puts " "+all_line
ff.puts "			@flag = true"
ff.puts "		else"
ff.puts "			@flag = false"
ff.puts "		end"
ff.puts "	end"
ff.puts "\n"

ff.puts "	def destroy"
ff.puts if_destroy
ff.puts all_line
ff.puts "	end"
ff.puts "\n"

ff.puts "	private"
ff.puts "\n"
ff.puts def_set
ff.puts set_line
ff.puts "	  end"
ff.puts "\n"

ff.puts def_param
ff.puts param_line
ff.puts "	  end"
ff.puts "end"
ff.close

system "sudo rm #{ARGV[1]}"
system "sudo mv new.rb #{ARGV[1]}"
end