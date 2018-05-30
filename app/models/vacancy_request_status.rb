class VacancyRequestStatus < ActiveRecord::Base
  belongs_to :vacancy_request
  belongs_to :action_by
end
