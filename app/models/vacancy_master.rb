class VacancyMaster < ActiveRecord::Base
  # protokoll :employee_code, pattern: 'VAC#####'
  belongs_to :department
  belongs_to :employee_designation
  belongs_to :company_location
  belongs_to :degree
  belongs_to :employee
  has_many :capture_resumes
  has_many :selected_resumes
  has_many :vacancy_request_histories
  has_many :particular_vacancy_requests
  has_many :reporting_masters_vacancy_masters
  has_many :reporting_masters, :through =>:reporting_masters_vacancy_masters 

  has_many :subordinates, class_name: 'VacancyMaster',
                          foreign_key: 'degree_1_id'
  belongs_to :degree_1, class_name: 'Degree'

  has_many :indirect_subordinates, class_name: 'VacancyMaster',
                                   foreign_key: 'degree_2_id'
  belongs_to :degree_2, class_name: 'Degree'

  validates :employee_designation_id, presence: true
  validates :no_of_position, presence: true
  validates :vacancy_post_date, presence: true
  # validates :reporting_master_id, presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |vacancy_master|
        csv << vacancy_master.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      vacancy_master = find_by_id(row['id']) || new
      vacancy_master.attributes = row.to_hash.slice(*row.to_hash.keys)
      vacancy_master.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::CSV.new(file.path, file_warning: :ignore)
    when '.xls' then Roo::Excel.new(file.path, file_warning: :ignore)
    when '.xlsx' then Roo::Excelx.new(file.path, file_warning: :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def accessible_attributes
    [employee_designation_id,experience,keyword,other_organization, department_id, degree_id, company_location_id, vacancy_name, no_of_position, description, vacancy_post_date, budget]
  end
end
