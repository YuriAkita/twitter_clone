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
  def edit
  end
  def update
    if @post.update(post_params)
      redirect_to posts_path,notice: "つぶやきが編集されました！"
    else
      render :edit
    end
  end
  def destroy
    @post.destroy
    redirect_to posts_path,notice: "つぶやきが削除されました！"
  end
  def confirm
    @post = Post.new(post_params)
    render :new
  end
  private
  def post_params
    params.require(:post).permit(:content)
  end
  def set_post
    @post = Post.find(params[:id])
  end
