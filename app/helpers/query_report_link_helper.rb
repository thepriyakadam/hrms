module QueryReportLinkHelper
  def link_to_download_report_pdf
    link_to t('views.links.pdf'), export_report_url_with_format('pdf'), target: '_blank', class: 'btn'
  end

  def link_to_download_report_csv
    link_to t('views.links.csv'), export_report_url_with_format('csv'), target: '_blank', class: 'btn'
  end

  def query_report_string_filter(current_status, value, options = {})
    text_field_tag current_status, value, options
  end

  def query_report_integer_filter(current_status, value, options = {})
    text_field_tag current_status, value, options
  end
    
end
