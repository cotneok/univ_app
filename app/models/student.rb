class Student < ApplicationRecord
  before_save {self.email = email.downcase}
  validates :name, presence: true, length: { minimum: 5, maximum: 50}
  VALD_EMAIL_REGEX=/\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 105},
            uniqueness: {case_sensitive: false},
            format: {with: VALD_EMAIL_REGEX}
  has_secure_password
  has_many :student_courses
  has_many :courses, through: :student_courses
end
