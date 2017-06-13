class Application < ActiveRecord::Base
  belongs_to :user
  validates :jobType, presence: true
  validates :division, presence: true
  validates :cv, presence: true
  validates :user_id, presence: true
end