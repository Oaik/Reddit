class FollowingChannelsController < ApplicationController
  before_action :set_following_channel, only: %i[ show edit update destroy ]
  before_action :valid_user, only: :destroy
  # GET /following_channels or /following_channels.json
  def index
    @following_channels = FollowingChannel.all
  end

  # GET /following_channels/1 or /following_channels/1.json
  def show
  end

  # GET /following_channels/new
  def new
    @following_channel = FollowingChannel.new
  end

  # GET /following_channels/1/edit
  def edit
  end

  # POST /following_channels or /following_channels.json
  def create
    @following_channel = FollowingChannel.new(following_channel_params)

    respond_to do |format|
      if @following_channel.save
        format.html { redirect_to @following_channel, notice: "Following channel was successfully created." }
        format.json { render :show, status: :created, location: @following_channel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @following_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /following_channels/1 or /following_channels/1.json
  def update
    respond_to do |format|
      if @following_channel.update(following_channel_params)
        format.html { redirect_to @following_channel, notice: "Following channel was successfully updated." }
        format.json { render :show, status: :ok, location: @following_channel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @following_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /following_channels/1 or /following_channels/1.json
  def destroy
    @following_channel.destroy
    respond_to do |format|
      format.html { redirect_to following_channels_url, notice: "Following channel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_following_channel
      @following_channel = FollowingChannel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def following_channel_params
      params.require(:following_channel).permit(:channel_id, :user_id)
      # params.fetch(:following_channel, {})
    end
    
    # validate that the current user is authorized
    def valid_user
      if @following_channel.user != current_user
        redirect_to following_channels_path, notice: "Not Authorized"
      end
    end
end
