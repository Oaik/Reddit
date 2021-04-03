class VotePostsController < ApplicationController
  before_action :set_vote_post, only: %i[ show edit update destroy ]
  before_action :valid_user, only: [:edit, :update, :destory]

  # GET /vote_posts or /vote_posts.json
  def index
    @vote_posts = VotePost.all
  end

  # GET /vote_posts/1 or /vote_posts/1.json
  def show
  end

  # GET /vote_posts/new
  def new
    @vote_post = VotePost.new
  end

  # GET /vote_posts/1/edit
  def edit
  end

  # POST /vote_posts or /vote_posts.json
  def create
    @vote_post = VotePost.new(vote_post_params)
    respond_to do |format|
      if @vote_post.save
        if vote_post_params[:isUpVote] != "0"
          @vote_post.post.update_attribute(:count, @vote_post.post.count + 1)
        else
          @vote_post.post.update_attribute(:count, @vote_post.post.count - 1)
        end
        format.html { redirect_to @vote_post, notice: "Vote post was successfully created." }
        format.json { render :show, status: :created, location: @vote_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vote_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vote_posts/1 or /vote_posts/1.json
  def update
    respond_to do |format|
      if @vote_post.update(vote_post_params)
        if vote_post_params[:isUpVote] != "0"
          @vote_post.post.update_attribute(:count, @vote_post.post.count + 2) #removing the downvote and increase one
        else
          @vote_post.post.update_attribute(:count, @vote_post.post.count - 2) #removing the upvote and decrease one
        end
        format.html { redirect_to @vote_post, notice: "Vote post was successfully updated." }
        format.json { render :show, status: :ok, location: @vote_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vote_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vote_posts/1 or /vote_posts/1.json
  def destroy
    if @vote_post[:isUpVote] != false
      @vote_post.post.update_attribute(:count, @vote_post.post.count - 1)
    else
      @vote_post.post.update_attribute(:count, @vote_post.post.count + 1)
    end
    @vote_post.destroy
    respond_to do |format|
      format.html { redirect_to vote_posts_url, notice: "Vote post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote_post
      @vote_post = VotePost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vote_post_params
      params.require(:vote_post).permit(:user_id, :post_id, :isUpVote)
    end

    # validate that the current user is authorized
    def valid_user
      if @vote_post.user != current_user
        redirect_to posts_path, notice: "Not Authorized"
      end
    end
end
