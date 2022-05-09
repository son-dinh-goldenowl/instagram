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
  validate  :valid_age, if: -> { birthday.present? }

  mount_uploader :avatar, ImageUploader
  before_save { email.downcase }

  private

  def valid_age
    return if valid_date_range.include?(birthday)
    errors.add(:birthday, message: :invalid_birthday)
  end

  def valid_date_range
    maximum_date..minimum_date
  end

  def minimum_date
    Date.new(Date.today.year - 6)
  end

  def maximum_date
    Date.new(Date.today.year - 120)
  end
end
