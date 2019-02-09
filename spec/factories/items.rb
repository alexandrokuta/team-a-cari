FactoryBot.define do

  factory :item do
    name Faker::Name.name
    price 4000
    describe "説明文"
    status "新品、未使用"
    burden "送料込み(出品者負担)"
    delivery_method "未定"
    prefecture "大阪府"
    delivery_day "1~2日で発送"
    seller_id nil
    buyer_id nil
    category_id 80
    brand_id 2
    size_id 2
  end
end
