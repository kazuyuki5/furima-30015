class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many  :items
         has_many  :orders

         KANJI_REGEX = /\A[ぁ-んァ-ン一-龥]/
         KANA_REGEX = /\A[ァ-ヶー－]+\z/
        with_options presence: true do
          validates :nickname
            with_options format: { with: KANJI_REGEX, message: "is invalid. Input full-width characters."} do
          validates :kanji_family_name
          validates :kanji_first_name
            end
            with_options format: { with: KANA_REGEX, message: "is invalid. Input full-width katakana characters."} do
          validates :kana_family_name
          validates :kana_first_name
            end
          validates :birthday
          end
end
