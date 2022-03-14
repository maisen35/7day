class Contact < ApplicationRecord
  enum subject: { normal: 0, report: 1, other: 2 }
  validates :name, presence: true
  validates :email, presence: true
  validates :message, presence: true
end
