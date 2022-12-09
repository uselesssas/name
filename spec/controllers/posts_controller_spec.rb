# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create :user }
  before { sign_in user }

  context 'before actions' do
    it { should use_before_action(:authenticate_user!) }
    it { should use_before_action(:set_post!) }
  end

  describe 'GET #index' do
    let(:posts) { create_list(:post, 2) }
    before { get :index }

    it { should render_template(:index) }

    it 'assigns posts' do
      subject
      expect(assigns(:posts)).to match_array(posts)
    end
  end

  describe 'GET #show' do
    let(:post) { create(:post) }
    let(:params) { { id: post } }
    before { get :show, params: params }

    it { should render_template(:show) }

    it 'assign post' do
      subject
      expect(assigns(:post)).to eq(post)
    end
  end

  describe 'GET #new' do
    before { get :new }

    it { should render_template(:new) }

    it 'assign a new post' do
      subject
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe 'POST #create' do
    let(:params) { { post: attributes_for(:post) } }
    before { post :create, params: params }

    it 'create a new post' do
      subject
      expect(assigns(:post)).to be_persisted
    end

    it 'redirect to post page' do
      expect(response).to redirect_to(post_path(assigns(:post)))
    end
  end

  describe 'GET #edit' do
    let(:post) { create(:post) }
    let(:params) { { id: post } }
    before { get :edit, params: params }

    it 'assign post' do
      subject
      expect(assigns(:post)).to eq(post)
    end

    it { should render_template(:edit) }
  end

  describe 'PATCH #update' do
    let(:post) { create(:post) }
    let(:params) { { id: post, user_id: user, post: { description: FFaker::Book.description } } }
    before { patch :update, params: params }


    it 'update the post' do
      subject
      expect(assigns(:post)).to eq(post)
    end

    it 'redirect to post page' do
      subject
      expect(response).to redirect_to(post_path(assigns(:post)))
    end
  end

  describe 'DELETE #destroy' do
    let(:post) { create(:post) }
    let(:params) { { id: post.id } }
    before { delete :destroy, params: params }

    it 'destroys the post' do
      subject
      expect(Post.exists?(post.id)).to be_falsey
    end

    it 'redirect to posts page' do
      subject
      expect(response).to redirect_to(posts_path)
    end
  end
end
