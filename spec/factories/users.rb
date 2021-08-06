FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 4) }    #'1''a'を足しているため、「4」になる！
    password_confirmation {password}
    nickname              {Faker::Name.initials(number: 2)}
    last_name             {'鈴木'}
    first_name            {'太郎'}
    last_name_kana        {'スズキ'}
    first_name_kana       {'タロウ'}
    birthday              {Faker::Date.birthday}
  end
end