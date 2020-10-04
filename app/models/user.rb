class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders

  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: VALID_NAME_REGEX,  message: "is invalid. Input full-width characters." }
    validates :last_name, format: { with: VALID_NAME_REGEX, message: "is invalid. Input full-width characters." }
    validates :first_name_kana,  format: { with: VALID_NAME_KANA_REGEX, message: "is invalid. Input full-width katakana characters." } 
    validates :last_name_kana, format: { with: VALID_NAME_KANA_REGEX, message: "is invalid. Input full-width katakana characters." }
    validates :birthday
  end
  password = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: password, message: 'には英字と数字の両方を含めて設定してください' 
end
