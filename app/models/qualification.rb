class Qualification < ActiveRecord::Base
  belongs_to :employee


  validates :no_of_member, :presence => true
  validates :f_name, :presence => true
  validates :l_name , :presence => true
  validates :date_of_birth, :presence => true
  validates :contact_no, :presence => true
  validates :adhar_no, :presence => true
  validates :relation, :presence => true
  validates_length_of :pin_code, is: 6,  message:"Please Enter 6 digit"
  validates_length_of :adhar_no, is: 12, message:"Please Enter 12 digit"
  validates_length_of :contact_no, within: 10..13, message:"Enter the Correct contact number"
end
