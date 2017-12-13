FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "something"
    overtime_request 3.5
    association :user
  end

  factory :second_post, class: Post do
    date Date.yesterday
    rationale "another thing"
    overtime_request 0.5
    association :user
  end

  factory :another_post, class: Post do
    date Date.yesterday
    rationale "some more content"
    overtime_request 1.0
    association :user
  end
end