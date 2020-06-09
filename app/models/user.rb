class User < ApplicationRecord
  include OmniauthAttributesConcern
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  

  validates :username, presence: true, length: { maximum: 20 }
  validates :fullname, presence: true, length: { maximum: 20 }
  
  has_many :gambits
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friends, class_name: "Following", foreign_key: "follower_id"
  has_many :followers, class_name: "Following", foreign_key: "followed_id"

  has_one_attached :avatar
  has_one_attached :cover_photo

  has_many :user_authentications

  def random
    self.followers.sample.follower
  end

  def self.create_from_omniauth(params)
    self.send(params.provider,params)
  end
end
