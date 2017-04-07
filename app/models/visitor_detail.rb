class VisitorDetail < ActiveRecord::Base
  belongs_to :meet_to
  belongs_to :authorized_by
end
