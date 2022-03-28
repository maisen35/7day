class Contact < ApplicationRecord
  enum subject: { normal: 0, report: 1, other: 2 }
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :name, presence: true
  # validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  # validates :message, presence: true
end
