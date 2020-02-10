require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'POST #create' do
    context 'with valid attributes' do
      before(:each) do
        user = FactoryBot.create(:user)
        sign_in user
      end

      it 'creates a post' do
        post :create, params: { post: attributes_for(:post)}
        expect(Post.count).to eq(1)
      end

      it 'redirects to the "root" action for the new post' do
        post :create, params: { post: attributes_for(:post)}
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid attributes' do
      before(:each) do
        user = FactoryBot.create(:user)
        sign_in user
      end

      it 'dose not create a post' do
        post :create, params: { post: attributes_for(:post, title: nil)}
        expect(Post.count).to eq(0)
      end

      it 're-renders the new view' do
        post :create, params: { post: attributes_for(:post, title: nil)}
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #index' do
    it 'populates an array of posts' do
      post = FactoryBot.create(:post)
      get :index
      expect(assigns(:posts)).to eq([post])
    end

    it 'renders the index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the correct post' do
      post = FactoryBot.create(:post)
      get :show, params: {id: post}
      expect(assigns(:post)).to eq(post)
    end
    it 'renders the show view' do
      post = FactoryBot.create(:post)
      get :show, params: {id: post}
      expect(response).to render_template :show
    end
  end
end