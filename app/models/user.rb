class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :username, presence: true
  

  has_many :channels, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
end
