class Greeting < ActiveRecord::Base
  belongs_to :sender,class_name: 'Employee'
  belongs_to :receiver,class_name: 'Employee'

  has_attached_file :birthday_image, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'Profile11.jpg'
  validates_attachment_content_type :birthday_image,  :content_type => /\Aimage\/.*\Z/,:message => 'only (png/gif/jpeg) images'
  validates_attachment_size :birthday_image, :less_than => 5.megabytes
end
