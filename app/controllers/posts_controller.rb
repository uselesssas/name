class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user_post!, only: %i[edit update destroy]

  def index
    user = User.find(cookies[:user_id])

    @posts = []
    Post.all.each do |post|
      @posts << post if post.user.id == user.id
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    user = User.find(cookies[:user_id])

    @post = Post.create(params[user_id: user])
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    authorize @post

    @post.destroy
    redirect_to root_path
  end

  private

  def set_user_post!
    @post = Post.find(cookies[:user_id])
  end

  def post_params
    params.require(:post).permit(:user_id, :description)
  end
end
