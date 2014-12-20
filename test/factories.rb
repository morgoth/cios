FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@example.com" }
    password "secret"
  end

  factory :post do
    user
    title "Post title"
    content "Body of post"
  end

  factory :comment do
    post
    name "John Doe"
    content "Body of comment"
  end

  factory :partner do
    kind "sponsor"
    name "Company"
    link "http://company.com"
  end
end
