class OrderForm
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture, :city, :building, :address, :telephone, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/ , message: "is invalid"}
    validates :prefecture, numericality: {other_than: 0 , message: "is invalid"}
    validates :city
    validates :address
    validates :telephone, format: {with: /\A[0-9]{10,11}\z/ , message: "is invalid"}
    validates :user_id
    validates :item_id
  end

  def save
    Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, building: building, address: address, telephone: telephone, purchase_id: purchase.id)
  end
end