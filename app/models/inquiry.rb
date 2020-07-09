class Inquiry < ApplicationRecord
  validates :subject, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 20 }
end
