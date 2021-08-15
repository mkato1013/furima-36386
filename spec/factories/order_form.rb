FactoryBot.define do
  factory :order_form do
    postal_code               {'100-0011'}
    prefecture_id             {Faker::Number.between(from: 1, to: 47)}
    city                      {'大阪市西区'}
    address                   {'青山１−１−１'}
    telephone                 {'11111111111'}
    token                     {"tok_31c7b6ec7904e870b8ed1c231702"}
    building                  {"あああ"}
  end
end
