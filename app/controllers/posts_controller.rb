class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
      if @post.save
        redirect_to new_post_path,notice: "つぶやきが作成されました！"
      else
        render :new
      end
    end
  end
  def show
  end
  private
  def post_params
    params.require(:post).permit(:content)
  end
  def set_post
    @post = Post.find(params[:id])
  end
