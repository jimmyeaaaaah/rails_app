class PostsController < ApplicationController

  def post_params
    params.require(:title, img_arr:[])
    params.permit(:caption)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      user_id: @current_user.id, 
      title: params[:title],
      caption: params[:caption]
      )

    if params[:img_arr] && @post.save
      FileUtils.mkdir_p("public/post_images/#{@post.id}")
      num = 1
      params[:img_arr].each do |img|
        @post_content = PostContent.new(
          post_id: @post.id,
          image_name:  "#{num}.jpg"
        )
        File.binwrite("public/post_images/#{@post.id}/#{@post_content.image_name}", img.read)
        @post_content.save
        num += 1
      end
      flash[:notice] = "投稿が完了しました"
      redirect_to("/users/#{@current_user.id}")
    else 
      @title = params[:email]
      @caption = params[:caption]
      if params[:img_arr].nil?
        @error_message = "画像を選択してください"
      end
      render("posts/new")
    end  
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

end
