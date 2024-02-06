FactoryBot.define do
  factory :item do
    image             { Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/images/Omelette_rice.jpeg'), 'image/jpeg') }
    item_name         { 'Example Item' }
    detail            { 'This is an example item description.' }
    category_id       { 2 }
    condition_id      { 3 }
    postage_id        { 3 }
    region_id         { 4 }
    delivery_time_id  { 2 }
    price             { 500 }
    association :user
  end
end
