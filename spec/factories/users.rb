FactoryBot.define do
  factory :user do
    first_name 'Aaron'
    last_name 'Summer'
    sequence(:email) { |n| "tester#{n}@example.com" }
    password 'jfaiowuts-dijaishg'
  end
end
