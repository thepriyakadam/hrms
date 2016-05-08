class SelectedResume < ActiveRecord::Base
  belongs_to :degree
  belongs_to :vacancy_master
end
