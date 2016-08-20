class Leave < ApplicationRecord
  validates :leave_class, presence: { message: "假別必須填寫~~~" }

  belongs_to :user
end
