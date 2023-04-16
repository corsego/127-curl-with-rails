class PostsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_post, only: %i[ show edit update destroy ]

  # curl -X GET http://localhost:3000/posts.json
  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # curl -X GET http://localhost:3000/posts/2.json
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

  # curl -X POST -H "Content-Type: application/json" -d '{"post": {"title": "first post", "published": "false"}}' http://localhost:3000/posts.json
  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # curl -X PATCH -H "Content-Type: application/json" -d '{"post": {"title": "UPDATED post", "published": "true"}}' http://localhost:3000/posts/1.json
  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # curl -X DELETE -H "Content-Type: application/json" http://localhost:3000/posts/1.json
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
      params.require(:post).permit(:title, :published)
    end
end
