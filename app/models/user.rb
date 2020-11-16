class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         KANJI_REGEX = /\A[ぁ-んァ-ン一-龥]/
         KANA_REGEX = /\A[ァ-ヶー－]+\z/
        with_options presence: true do
         validates :nickname
         validates :kanji_family_name, format: { with: KANJI_REGEX, message: "is invalid. Input full-width characters."}
         validates :kanji_first_name, format: { with: KANJI_REGEX, message: "is invalid. Input full-width characters."}
         validates :kana_family_name, format: { with: KANA_REGEX, message: "is invalid. Input full-width katakana characters."}
         validates :kana_first_name, format: { with: KANA_REGEX, message: "is invalid. Input full-width katakana characters."}
         validates :birthday
        end
end
