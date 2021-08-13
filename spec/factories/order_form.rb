FactoryBot.define do
  factory :order_form do
    postal_code               {'100-0011'}
    prefecture                {4}
    city                      {'大阪市西区'}
    address                   {'青山１−１−１'}
    telephone                 {19010100101}
    user_id                   {1}
    item_id                   {1}
  end
end
