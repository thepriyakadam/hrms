require 'rbconfig'
if RbConfig::CONFIG['host_os'] =~ /linux/
arch = RbConfig::CONFIG['host_cpu'] == 'x86_64' ? 'wkhtmltopdf_linux_x64' : 'wkhtmltopdf_linux_386'
elsif RbConfig::CONFIG['host_os'] =~ /darwin/
arch = 'wkhtmltopdf_darwin_386'
# else
# raise "Invalid platform. Must be running Intel-based Linux or OSX."
end
 WickedPdf.config = {
    exe_path: "#{ENV['GEM_HOME']}/gems/wkhtmltopdf-binary-#{Gem.loaded_specs['wkhtmltopdf-binary'].version}/bin/#{arch}"

    # :exe_path => 'c:/Program Files (x86)/wkhtmltopdf/bin/wkhtmltopdf.exe'


#  # exe_path: "#{ENV['GEM_HOME']}/gems/wkhtmltopdf-binary-#{Gem.loaded_specs['wkhtmltopdf-binary'].version}/bin/#{arch}"
# :exe_path => 'c:/Program Files (x86)/wkhtmltopdf/bin/wkhtmltopdf.exe'
}