class TrainingTopicMaster < ActiveRecord::Base
validates :name, presence: true,  uniqueness: { case_sensitive: false }
validates :code, presence: true, uniqueness: { case_sensitive: false }
has_many :training_requests
has_many :training_plans
has_many :trainee_requests


    def self.import(file)
     spreadsheet = open_spreadsheet(file)
     (2..spreadsheet.last_row).each do |i|
        
        code = spreadsheet.cell(i,'B').to_i
        if code == 0
           code = spreadsheet.cell(i,'B')
         else
          code = spreadsheet.cell(i,'B').to_i
        end
        name = spreadsheet.cell(i,'C')
        description = spreadsheet.cell(i,'D')
       
        @training = TrainingTopicMaster.find_by(name: name)
        if @training.nil?
        @training_topic_master = TrainingTopicMaster.create(code: code,name: name,description: description)     
        else
          @training.update(code: code,name: name,description: description)
        end
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
