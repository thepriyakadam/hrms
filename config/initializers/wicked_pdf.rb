require 'rbconfig'
if RbConfig::CONFIG['host_os'] =~ /linux/
arch = RbConfig::CONFIG['host_cpu'] == 'x86_64' ? 'wkhtmltopdf_linux_x64' : 'wkhtmltopdf_linux_386'
elsif RbConfig::CONFIG['host_os'] =~ /darwin/
arch = 'wkhtmltopdf_darwin_386'
# else
# raise "Invalid platform. Must be running Intel-based Linux or OSX."
end
WickedPdf.config = {
  #:wkhtmltopdf => '/usr/local/bin/wkhtmltopdf',
  #:layout => "pdf.html",
  :exe_path => 'C:/Program Files (x86)/wkhtmltopdf/bin/wkhtmltopdf.exe'
}