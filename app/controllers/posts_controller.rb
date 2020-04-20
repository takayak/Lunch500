class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]
  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end
  def new
    @post = Post.new
  end
  def index_rank
    @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(20).pluck(:post_id))
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  def create
    @post = Post.new(post_params)
    results = Geocoder.search(@post[:address])
    @latlng = results.first.coordinates
    @post[:latitude] = @latlng[0]
    @post[:longitude] = @latlng[1]
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def top
  end

  def practicejs
    
  end
  def search
    @posts = Post.search(params[:keyword])
  end
  

  private
  def post_params
    params.require(:post).permit(:content,:image,:address,:latitude,:longitude,:title)
  end
end
