class FrequestQuestion < ActiveRecord::Base
  belongs_to :employee

  	def self.import(file)
       spreadsheet = open_spreadsheet(file)
       (2..spreadsheet.last_row).each do |i|
        code = spreadsheet.cell(i,'B').to_i
        question = spreadsheet.cell(i,'C')
        answer = spreadsheet.cell(i,'D')
        status = spreadsheet.cell(i,'D')
        status = spreadsheet.cell(i,'E')
        if status == "Active" || status == "active"
          status = true
        else
          status = false
        end

        @frequest_question = FrequestQuestion.create(code: code,question: question,answer: answer,status: status)
      end
    end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, file_warning: :ignore)
      when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

end

