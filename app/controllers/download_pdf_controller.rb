class DownloadPdfController < ApplicationController
  def index
    session[:active_tab] = "form_16"
  end

  # def zip
  #   send_file Rails.root.join('private', 'tasks.zip'), :type=>"application/zip", :x_sendfile=>true
  # end

  def pdf
    send_file Rails.root.join('private', 'form_16.pdf'), :type=>"application/pdf", :x_sendfile=>true
  end

  # def doc
  #   send_file Rails.root.join('private', 'tasks.docx'), :type=>"application/doc", :x_sendfile=>true
  # end
end