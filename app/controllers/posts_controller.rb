class PostsController < ApplicationController
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
  private
  def post_params
    params.require(:post).permit(:content)
  end
