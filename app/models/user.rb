class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  attachment :profile_image
  
  has_many :posts, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true, length: {in: 2..20 }, format: { with: /\A[\w]+\z/, message: "は半角英数字、アンダーバーのみ使用できます" }
  validates :display_name, presence: true, length: {in: 2..20 }
  validates :password, presence: true, length: {in:6..128 }, format: { with: /\A[\w]+\z/ }
  validates :email, uniqueness: true
  
  def email_required?
    false
  end
  
  def email_changed?
    false
  end
end
