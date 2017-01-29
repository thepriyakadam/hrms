class Role < ActiveRecord::Base
  has_many :members

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
