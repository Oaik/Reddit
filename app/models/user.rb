class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # Validation
  validates :username, presence: true
  
  # Association
  has_many :channels
  has_many :comments
  has_many :posts
  has_many :following_channels
end
