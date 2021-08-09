FactoryBot.define do
  factory :item do
    item_name               {'商品の名前'}
    introduction            {'商品の説明です。'}
    category_id             {2}
    status_id               {2}
    claim_id                {2}
    area_id                 {2}
    send_day_id             {2}
    price                   {'300'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/star.png'), filename: 'star.png')
    end
  end
end
