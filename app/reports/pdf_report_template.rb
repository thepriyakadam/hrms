class PdfReportTemplate < QueryReport::ReportPdf
  def render_header
    # pdf.text 'Company Name: BFTL', size: 20, style: :bold
    # pdf.text "Address: Plot D1- D4 Industrial Area,
    #           Dewas M.P. Pin 455001", size: 12
    # filename = "#{Rails.root}/app/assets/images/avatar.png"
    # pdf.image filename, width: 100, height: 100, align: :center
    # report.filters.each do |filter|
    #   filter.comparators.each do |comparator|
    #     pdf.text "#{comparator.name} : #{comparator.param_value}" if comparator.param_value.present?
    #   end
    # end
    # pdf.move_down 20
  end

  def render_footer
    # pdf.move_down 20
    # pdf.text "Copyright to @indiba", :size => 12
  end

  def to_pdf
    render_header
    super
    render_footer
    pdf
  end
end
