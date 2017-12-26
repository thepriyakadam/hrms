class Rating < ActiveRecord::Base
	validates :value, presence: true,uniqueness: { case_sensitive: false }

	has_many :goal_ratings, class_name: "Rating",
                          foreign_key: "appraisee_rating_id"

  	has_many :goal_ratings, class_name: "Rating",
                          foreign_key: "appraiser_rating_id"

    has_many :goal_bunches, class_name: "Rating",
                          foreign_key: "reviewer_rating_id"

  	has_many :goal_bunches, class_name: "Rating",
                          foreign_key: "final_rating_id"


    def self.import(file)
     spreadsheet = open_spreadsheet(file)
     (2..spreadsheet.last_row).each do |i|
        
        value = spreadsheet.cell(i,'B')
        discription = spreadsheet.cell(i,'C')
        status = spreadsheet.cell(i,'D')
        if status == "Yes" || status == "yes"
        	status = true
        else
        	status = false
        end
        @degree = Rating.create(value: value,discription: discription,status: status)     
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
