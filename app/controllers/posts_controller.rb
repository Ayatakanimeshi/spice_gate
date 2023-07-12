class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @shops = Shop.all
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:notice] = "投稿に成功しました"
      redirect_to root_path
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      flash[:notice] = "投稿を更新しました"
      redirect_to @post
    else
      flash[:alert] = "投稿の更新に失敗しました"
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to posts_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:user_id, :shop_id, :shop_prefecture, :title, :spiciness, :curry_img)
    end
end
