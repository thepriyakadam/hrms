class DailyBillDetail < ActiveRecord::Base
  belongs_to :travel_request
  belongs_to :travel_expence_type
  belongs_to :reporting_masters
  belongs_to :currency_master
  belongs_to :employee
  belongs_to :mode
  belongs_to :expence_opestion
  belongs_to :billing_option
  has_many :daily_bill_detail_histories
  has_many :reportiong_masters_travel_requests
  validates :expence_date, presence: true
  validates :e_place, presence: true
  validates :travel_expence, presence: true

  has_attached_file :passport_photo, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'missing.png'
  validates_attachment_content_type :passport_photo, :content_type => /\Aimage\/.*\Z/,:message => 'only (png/gif/jpeg) images'
  has_attached_file :avatar_file,
  :path => "attachments/attach_daily_bills/:basename.:extension"

  #validates_attachment_presence :avatar
  validates_attachment_size :avatar_file, less_than: 2.megabytes
  validates_attachment :avatar_file, content_type: { content_type: %w(application/pdf application/msword application/msexcel application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
end
