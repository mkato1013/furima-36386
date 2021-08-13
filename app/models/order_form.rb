class OrderForm
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture, :city, :building, :address, :telephone, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/ , message: "is invalid"}
    validates :prefecture, numericality: {other_than: 0 , message: "can't be blank"}
    validates :city
    validates :address
    validates :telephone, format: {with: /\d{10,11}/ , message: "is invalid"}
  end

  def save
    Purchase.create(item_id: item.id, user_id: user.id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, telephone: telephone, purchase_id: purchase.id)
  end
end