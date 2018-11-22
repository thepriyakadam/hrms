class Topic < ActiveRecord::Base
  belongs_to :employee
  has_many :topic_comments
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '200x200>' }, default_url: 'Profile11.jpg'
  validates_attachment_content_type :avatar,  :content_type => /\Aimage\/.*\Z/,:message => 'only (png/gif/jpeg) images'
  validates_attachment_size :avatar, :less_than => 50.megabytes
end
