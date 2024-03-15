class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates :comment, presence: true
  
  scope :latest, -> { order(created_at: :desc) }
  scope :old, -> { order(created_at: :asc) }
end
