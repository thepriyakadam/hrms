class Skillset < ActiveRecord::Base
  belongs_to :employee


  validates :name, :presence => true 
  validate :skillset_regex

  def skillset_regex
    if name.present? and not name.match(/\A[A-Za-z_]{1,30}\Z/)
      errors.add :name,"Name allows only Characters"
    end
  end

end
