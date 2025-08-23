class Admin::ForumSubforumsController < ApplicationController
  before_action :require_admin_user
  before_action :set_admin_forum_subforum, only: %i[ show edit update destroy ]

  # GET /admin/forum_subforums or /admin/forum_subforums.json
  def index
    @admin_forum_subforums = ForumSubforum.all
  end

  # GET /admin/forum_subforums/1 or /admin/forum_subforums/1.json
  def show
    @admin_forum_threads = ForumThread.all
  end

  # GET /admin/forum_subforums/new
  def new
    @admin_forum_subforum = ForumSubforum.new
  end

  # GET /admin/forum_subforums/1/edit
  def edit
  end

  # POST /admin/forum_subforums or /admin/forum_subforums.json
  def create
    @admin_forum_subforum = ForumSubforum.new(admin_forum_subforum_params)

    respond_to do |format|
      if @admin_forum_subforum.save
        format.html { redirect_to @admin_forum_subforum, notice: "Forum subforum was successfully created." }
        format.json { render :show, status: :created, location: @admin_forum_subforum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_forum_subforum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/forum_subforums/1 or /admin/forum_subforums/1.json
  def update
    respond_to do |format|
      if @admin_forum_subforum.update(admin_forum_subforum_params)
        format.html { redirect_to @admin_forum_subforum, notice: "Forum subforum was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @admin_forum_subforum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_forum_subforum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/forum_subforums/1 or /admin/forum_subforums/1.json
  def destroy
    @admin_forum_subforum.destroy!

    respond_to do |format|
      format.html { redirect_to admin_forum_subforums_path, notice: "Forum subforum was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_forum_subforum
      @admin_forum_subforum = ForumSubforum.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def admin_forum_subforum_params
      params.require(:forum_subforum).permit(:name, :forum_forum_id)
    end

    def require_admin_user
      if !admin_user_signed_in?
        raise ActiveRecord::RecordNotFound# 404 page
      end
    end
end
