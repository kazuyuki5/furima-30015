class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :address, :building, :phone_number


  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]+\z/}, numericality: {less_than_or_equal_to: 11}
  end
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

    def save
      order = Order.create(item_id: item.id, user_id: user.id)
      Address.create(postal_code: postal_code, area_id: area.id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id) 
    end
end