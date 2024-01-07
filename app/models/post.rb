class Post < ApplicationRecord
  belongs_to :user
  belongs_to :live, foreign_key: :live_name
  
  validates :live_date, presence: true
  validates :venue, presence: true
  validates :live_name, presence: true
  #validates :category, presence: true
  validates :comment, presence: true

end
