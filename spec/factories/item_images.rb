FactoryBot.define do
  factory :item_image do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/image/spec.jpg'), 'image/jpeg') }
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    item
  end
end
