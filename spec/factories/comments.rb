FactoryBot.define do
  factory :comment do
    sequence(:user_id) {|n| n}
    sequence(:post_id) {|n| n}
    body { "post comments" }
    body_html { "MyText" }
    association :user, factory: :user
    association :post, factory: :post
  end
end
