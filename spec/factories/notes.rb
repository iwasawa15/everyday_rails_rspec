FactoryBot.define do
  factory :note do
    message 'My importnat note.'
    association :project
    association :user
  end
end
