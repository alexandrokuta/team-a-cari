FactoryBot.define do

  factory :user do
    nickname              "taichiro"
    email                 "test@gmail.com"
    password              "000000"
    password_confirmation "000000"
    pay_id nil
  end

  factory :invalid_user do
    nickname              "taichiro"
    email                 "test@gmail.com"
    password              "00000"
    password_confirmation "00000"
  end

  # factory :user do
  #   nickname              Faker::Name.last_name
  #   email                 Faker::Internet.unique.free_email
  #   password              Faker::Internet.password(6)
  #   password_confirmation password
  # end

  # factory :invalid_user do
  #   nickname              Faker::Name.last_name
  #   email                 Faker::Internet.unique.free_email
  #   password              Faker::Internet.password(1, 5)
  #   password_confirmation password
  # end

end
