class BlogsController < ApplicationController
  before_action :set_blog, only:[:edit, :update, :destroy]
  
  def index
    @blogs = Blog.all 
  end

  def new
    if params[:back]
      @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
    end
  end
  
  def create
    @blog = Blog.create(blogs_params)
    if @blog.save
      redirect_to blogs_path, notice: "Twootを作成しました！"
    else
      render 'new'
    end
  end  
  
  def confirm
    @blog = Blog.new(blogs_params)
      render :new if @blog.invalid?
  end
  
  def edit
    @blog 
  end
         
  def update
      if@blog.update(blogs_params)
       redirect_to blogs_path, notice: "Twootを更新しました！"
      else
        render 'new'
      end
  end
  
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "Twootを削除しました！"
  end
  
  
  private
    def blogs_params
      params.require(:blog).permit(:content)
    end
  
  #idをキーとして値を取得するメソッド
    def set_blog
      @blog = Blog.find(params[:id])
    end    
end