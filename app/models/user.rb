class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\d[0-9]\)*\z/

  validates :fullname, presence: true, length: { maximum: 50 }
  validates :user_name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, on: :create
  validates :birthday, presence: true, validate_age: { message: :invalid_birthday }, if: -> { birthday.present? }
  validates :telephone, length: { minimum: 9, maximum: 11 },
            format: { with: VALID_PHONE_REGEX ,
            message: :invalid_phone }, if: -> { telephone.present? }

  mount_uploader :avatar, ImageUploader
  before_save { email.downcase }
end
