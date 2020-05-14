class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post
    else
      render 'new'
    end

    def update
      if @post.update(post_params)
        redirect_to @post
      else
        render 'edit'
      end
    end
  end

  def destroy
    @post.destroy
    # // TODO:
    # redirect to posts index if deleting from index,
    # users show if from post show
    redirect_to users_path(@user)
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
