class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  has_many :applications
  validates :username,
            presence: true,
            uniqueness: {case_sensitivie: false},
            length: {minimum: 3, maximum: 20}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: {with: VALID_EMAIL_REGEX }

  validates :firstName,
            presence: true,
            length: {minimum: 2}

  validates :lastName,
            presence: true,
            length: {minimum: 2}

  validates :phoneNumber,
            presence: true,
            numericality: { only_integer: true},
            length: { is: 9}

  has_secure_password
end