class Inquiry < ApplicationRecord
  has_many :followups, dependent: :destroy

  validates :subject, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 20 }
end
