class Approval < ApplicationRecord
  belongs_to :User

  enum status: [:pending, :approved, :not_approved]
end
