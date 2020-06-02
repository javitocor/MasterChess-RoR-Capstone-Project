class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: { maximum: 20 }
  validates :fullname, presence: true, length: { maximum: 20 }
  
  has_many :gambits
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friends, class_name: "Following", foreign_key: "follower_id"
  has_many :followers, class_name: "Following", foreign_key: "followed_id"
end
