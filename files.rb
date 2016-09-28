Dir.chdir(ARGV[0]) do
  create = File.new("create.js.erb", "w")
	create.puts('<% if @flag %>
  	$("#form").html("<%= j render \'form\' %>")
  	$("#list").html("<%= j render \'list\' %>")
	<% else %>
  	$("#form").html("<%= j render \'form\' %>")
	<% end %>')
	create.close

	update = File.new("update.js.erb", "w")
	update.puts('<% if @flag %>
  	$("#form").html("<%= j render \'form\' %>")
  	$("#list").html("<%= j render \'list\' %>")
	<% else %>
  	$("#form").html("<%= j render \'form\' %>")
	<% end %>')
	update.close

	edit = File.new("edit.js.erb", "w")
	edit.puts('$("#form").html("<%= j render \'form\' %>")')
	edit.close

	destroy = File.new("destroy.js.erb", "w")
	destroy.puts('$("#form").html("<%= j render \'form\' %>")')
	destroy.close

	system 'sudo cp index.html.erb _list.html.erb'
	system 'sudo chmod 777 _list.html.erb'

	index = File.new("index.html.erb", "w")
	index.puts('<div class="box box-default">')
	index.puts('<div class="box-header with-border">')
	index.puts('<h3 class="box-title">Company Type</h3>')
	index.puts('</div><!-- /.box-header -->')
	index.puts('<div class="box-body">')
	index.puts('<div id="form"><%= render \'form\' %></div>')
	index.puts('<div id="list"><%= render \'list\' %></div>')	
	index.puts('</div><!-- /.box-body -->')
	index.puts('</div><!-- /.box -->')
	index.close

	system 'sudo rm edit.html.erb'
	system 'sudo rm new.html.erb'
	system 'sudo rm index.json.jbuilder'
	system 'sudo rm show.html.erb'
	system 'sudo rm show.json.jbuilder'
end