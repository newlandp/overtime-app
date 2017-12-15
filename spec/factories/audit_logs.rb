FactoryGirl.define do
  factory :audit_log do
    status 1
    start_date "2017-12-14"
    end_date "2017-12-14"
    association :user
  end
end
