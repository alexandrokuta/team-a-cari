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
    category_id 80
    seller_id nil
    buyer_id nil
    trade 0
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    brand_id 1
    size_id 1
    # item.create! (name: name,
    #               price: price,
    #               describe: describe,
    #               status: status,
    #               burden: burden,
    #               delivery_method: delivery_method,
    #               prefecture: prefecture,
    #               delivery_day: delivery_day,
    #               seller_id: seller_id,
    #               buyer_id: buyer_id,
    #               category_id: category_id,
    #               brand_id: brand_id,
    #               size_id: size_id
    #             )
  end
end
