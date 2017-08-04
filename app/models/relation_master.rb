class RelationMaster < ActiveRecord::Base

has_many :employee_nominations
has_many :families

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :code, presence: true,uniqueness: { case_sensitive: false }
end
