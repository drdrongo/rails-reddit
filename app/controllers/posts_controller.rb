class PostsController < ApplicationController
   http_basic_authenticate_with name: "dhh", password: "secret", except: :index

   def index
     render plain: "Everyone can see me!"
   end

   def edit
     render plain: "I'm only accessible if you know the password"
   end

  # def index
  #   @posts = Post.all
  # end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  # def edit
  #   @post = Post.find(params[:id])
  # end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
