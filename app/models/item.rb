class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :claim
  belongs_to :area
  belongs_to :send_day

  with_options presence: true do
    validates :image
    validates :item_name
    validates :introduction
    with_options numericality: { other_than: 0 , message: "can't be blank"} do
      validates :category_id
      validates :status_id
      validates :claim_id
      validates :area_id
      validates :send_day_id
    end
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, format: {with: /\A[0-9]\z/} ,message: "is invalid"}

  end
end