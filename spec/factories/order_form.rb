FactoryBot.define do
  factory :order_form do
    postal_code               {'100-0011'}
    prefecture_id             {4}
    city                      {'大阪市西区'}
    address                   {'青山１−１−１'}
    telephone                 {0+9010100101}
    user_id                   {1}
    item_id                   {1}
    token                     {"tok_31c7b6ec7904e870b8ed1c231702"}
    building                  {"あああ"}
  end
end
