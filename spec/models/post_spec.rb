require 'rails_helper'

RSpec.describe Post, type: :model do
  it "has a valid factory" do
    expect(build(:post)).to be_valid
  end

  it { should belong_to(:user) }
  it { should have_many(:comments)}
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:image_url) }
end