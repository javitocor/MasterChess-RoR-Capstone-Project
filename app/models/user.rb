class User < ApplicationRecord
  after_commit :add_default_avatar, on: [:create, :update]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: { maximum: 20 }
  validates :fullname, presence: true, length: { maximum: 20 }

  has_many :gambits
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friends, class_name: 'Following', foreign_key: 'follower_id'
  has_many :followers, class_name: 'Following', foreign_key: 'followed_id'

  has_one_attached :avatar
  has_one_attached :cover_photo

  def random
    followers.sample.follower
  end
  private 

  def add_default_avatar
    unless avatar.attached?
      self.avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "default.jpeg")), filename: 'avatar_default.jpg' , content_type: "image/jpg")
    end
  end

end
