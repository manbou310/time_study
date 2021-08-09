FactoryBot.define do
  factory :channel do
    channel_name {Faker::Team.name}
  end
end