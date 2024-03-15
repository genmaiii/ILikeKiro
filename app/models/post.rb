class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  belongs_to :live, foreign_key: :live_name, optional: true
  
  validates :live_date, presence: true
  validates :venue, presence: true
  validates :category, presence: true
  validates :live_name, presence: true
  validates :comment, presence: true
  
  scope :latest, -> { order(created_at: :desc) }  #desc = 降順
  scope :old, -> { order(created_at: :asc) }  #asc = 昇順
  scope :latest_update, -> { order(updated_at: :desc) }
  scope :old_update, -> { order(updated_at: :asc) }
  scope :most_favorited, -> { includes(:favorited_users)
    .sort_by { |x| x.favorited_users.includes(:favorites).size }.reverse }

end
