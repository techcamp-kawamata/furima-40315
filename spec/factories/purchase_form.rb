FactoryBot.define do
  factory :purchase_form do
    post_code     { '123-4567' }
    region_id     { 15 }
    municipality  { '横浜市緑区' }
    house_number  { '青山1-1-1' }
    building_name { '柳ビル103' }
    phone_number  { '09012345678' }
    price         { 3000 }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
