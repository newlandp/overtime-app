FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "something"
    association :user
  end

  factory :second_post, class: Post do
    date Date.yesterday
    rationale "another thing"
    association :user
  end
end