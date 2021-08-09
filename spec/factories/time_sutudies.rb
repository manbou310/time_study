FactoryBot.define do
  factory :time_study do
    date {'2021-08-01'}
    process_name {'工程名'}
  end

  trait :with_nested_instances do
    after( :create ) do |time_study|
      create :add_form, id: time_study.id
    end
  end  
end