require 'rails_helper'

describe CommentsController, type: :controller do
  describe 'POST #create' do
    context 'with valid attributes' do
      before(:each) do
        @user = FactoryBot.create(:user)
        @post = FactoryBot.create(:post)
        sign_in @user
        @comment_attributes = FactoryBot.attributes_for(:comment)
      end

      it 'creates the comment' do
        post :create, params: {user_id: @user.id, post_id: @post.id, comment: @comment_attributes }
        expect(Comment.count).to eq(1)
      end

      it 'renders the comment' do
        post :create, params: {user_id: @user.id, post_id: @post.id, comment: @comment_attributes}
        expect(response).to redirect_to @post
      end
    end

    context 'with invalid attributes' do
      before(:each) do
        @user = FactoryBot.create(:user)
        @post = FactoryBot.create(:post)
        sign_in @user
        @comment_attributes = {body: nil}
      end

      it 'dose not create the comment' do
        post :create, params: {user_id: @user.id, post_id: @post.id, comment: @comment_attributes }
        expect(Comment.count).to eq(0)
      end
    end
  end
end