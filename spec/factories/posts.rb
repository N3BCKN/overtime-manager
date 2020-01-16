FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "Some Rationale"
    user
    status 0
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Some more content"
    user
    status 0
  end
end
