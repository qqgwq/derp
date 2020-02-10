class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates :body, presence: true

  auto_html_for :body do
    html_escape
    image
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end
end
