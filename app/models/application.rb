class Application < ActiveRecord::Base
  validates :jobType, presence: true
  validates :division, presence: true
  validates :cv, presence: true
end