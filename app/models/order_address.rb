class UserDonation
  include ActiveModel::Model
  attr_accessor :nickname, :kanji_family_name, :kanji_first_name, :kana_family_name, :kana_first_name, :birthday, :image, :name, :explanation, :price, :category_id, :condition_id, :delivery_fee_id, :area_id, :delivery_day_id, :postal_code, :city, :address, :building, :phone_number


  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]+\z/}, numericality: {less_than_or_equal_to: 11}
  end
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

    def save
      user = User.create(nickname: nickname, kanji_family_name: kanji_family_name, kanji_fi rst_name: kanji_first_name, kana_family_name: kana_family_name, kana_first_name: kana_first_name, birthday: birthday)
      item = Item.create(image: image, name: name, explanation: explanation, price: price, category_id: category.id, delivery_fee_id: delivery_fee.id, area_id: area.id, delivery_day_id: delivery_day.id)
      order = Order.create(item_id: item.id, user_id: user.id)
      Address.create(postal_code: postal_code, area_id: area.id, city: city, address: address, building: building, order_id: order.id) 
    end
end