class Application < ActiveRecord::Base
  validates :jobType, presence: true
  validates :division, presence: true
end