class Application < ActiveRecord::Base
  belongs_to :user
  validates :jobType, presence: true
  validates :division, presence: true
  validates :user_id, presence: true

  mount_uploader :cv, CvUploader
  validates_presence_of :cv
  mount_uploader :certificates, CertificatesUploader

end