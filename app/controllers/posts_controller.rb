class PostsController < ApplicationController
  before_action :set_post, only: %i[show]

  def index
    if params[:sort] == "asc"
      @posts = Post.all.order(created_at: "ASC")
    else
      @posts = Post.all.order(created_at: "DESC")
    end
    @post = Post.new
  end 

  def show
    if params[:sort] == "asc"
      @comments = @post.comments.order(created_at: "ASC")
    else
      @comments = @post.comments.order(created_at: "DESC")
    end
    @comment = Comment.new
  end 

  def comment
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post_id), notice: "コメントしました"
    else
      @content = params[:content]
      # flash.now[:alert] = "文字数が多いか空白です"
      @post = Post.find(params[:id])
      @comments = Comment.all.order(created_at: "DESC")
      render :show
    end 
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: "投稿しました"
    else
      @title = params[:title]
      @content = params[:content]
      # flash.now[:alert] = "文字数が多いか空白欄があります"
      @posts = Post.all.order(created_at: "DESC")
      render :index
    end 

    # respond_to do |format|
      # if @post.save
        # redirect_to root_path, notice: "投稿しました"
      # else
        # render :new
      # end
    # end
  end 

  private

    def set_post
      @post = Post.find(params[:id])
    end 

    def post_params
      params.require(:post).permit(:title, :content)
    end 
    
    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
end
