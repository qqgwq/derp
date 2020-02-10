FactoryBot.define do
  factory :post do
    sequence(:title) {|n| "post#{n}"}
    image_url { "http://imgur.com" }
    sequence(:user_id) {|n| n}
    association :user, factory: :user
    image_url_html { "hahah" }
  end
end
