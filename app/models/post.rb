class Post < ApplicationRecord
  belongs_to :user
  belongs_to :live, foreign_key: :live_name_id
  
  validates :comment, presence: true

end
