class User < ApplicationRecord
  after_commit :add_default_avatar, on: [:create, :update]
  after_commit :add_default_cover, on: [:create, :update]
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
    followers.uniq.sample(3)
  end

  private 

  def add_default_avatar
    unless avatar.attached?
      self.avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "avatar_default.jpg")), filename: 'avatar_default.jpg' , content_type: "image/jpg")
    end
  end

  def add_default_cover
    unless cover_photo.attached?
      self.cover_photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "cover_default.jpg")), filename: 'cover_default.jpg' , content_type: "image/jpg")
    end
  end

end
