FactoryBot.define do
  factory :add_form do
    production_name {'車'}
    serial_number {'00000'}
    start_time {'00:00:00'}
    ending_time {'01:00:00'}
    forgetting {true}
    problem {true}
  end
end