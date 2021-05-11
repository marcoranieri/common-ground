# class PostsController < ApplicationController
#   include ActionView::RecordIdentifier

#   before_action :set_post, only: [ :show, :edit, :update ]

#   def index
#     @posts = Post.order(created_at: :desc)
#   end

#   def show
#     @comment = Comment.new
#   end

#   def new
#     @post = Post.new
#   end

#   def create
#     @post = Post.new(post_params)
#     @post.user = current_user

#     respond_to do |format|
#       if @post.save
#         redirect_to :posts
#       else
#         format.turbo_stream {
#           render turbo_stream: turbo_stream.replace(dom_id(@post), partial: "posts/form", locals: { post: @post })
#          }
#         format.html { redirect_to :posts }
#       end
#     end
#   end

#   def edit

#   end

#   def update
#     @post.update(post_params)

#     redirect_to post_path(@post)
#   end

#   private

#   def post_params
#     params.require(:post).permit(:title, :body)
#   end

#   def set_post
#     @post = Post.find(params[:id])
#   end

# end

class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.order(created_at: :desc)
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.turbo_stream { turbo_stream.append "all-posts", @post}
        # format.html { redirect_to @post, notice: "Post was successfully created." }
        format.html { redirect_to :posts, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(dom_id(@post), partial: "posts/form", locals: { post: @post })
         }
        format.html { redirect_to :posts }
        # format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
