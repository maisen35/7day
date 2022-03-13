class Contact < ApplicationRecord
  enum subject: { normal: 0, report: 1, other: 2 }
end
