class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :delivery_day
  has_one_attached :image

  with_options presence: true do
  validates :image, :name, :explanation, :price format: { with: 300 =< 9999999, \d }
   with_option numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :area_id
    validates :delivery_day_id
   end
  end
end
