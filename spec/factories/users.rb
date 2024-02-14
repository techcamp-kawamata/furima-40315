FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.email }
    password              { 'a1' + Faker::Internet.password(min_length: 6, mix_case: false) }
    password_confirmation { password }
    last_name             { 'やマ田' }
    first_name            { '太ろウ' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2019-12-31') }
  end
end
