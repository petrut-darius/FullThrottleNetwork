class Admin::ForumForumsController < ApplicationController
  before_action :require_admin_user
  before_action :set_admin_forum_forum, only: %i[ show edit update destroy ]

  def index
    @admin_forum_forums = ForumForum.all
  end

  def show
    @admin_forum_subforums = ForumSubforum.all
  end

  def new
    @admin_forum_forum = ForumForum.new
  end

  def edit
  end

  def create
    @admin_forum_forum = ForumForum.new(admin_forum_forum_params)
    @admin_forum_forum.admin_user = current_admin_user

    respond_to do |format|
      if @admin_forum_forum.save
        format.html { redirect_to [ :admin, @admin_forum_forum ], notice: "Forum forum was successfully created." }
        format.json { render :show, status: :created, location: @admin_forum_forum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_forum_forum.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_forum_forum.update(admin_forum_forum_params)
        format.html { redirect_to [ :admin, @admin_forum_forum ], notice: "Forum forum was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @admin_forum_forum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_forum_forum.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_forum_forum.destroy!
    respond_to do |format|
      format.html { redirect_to admin_forum_forums_path, notice: "Forum forum was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

    def set_admin_forum_forum
      @admin_forum_forum = ForumForum.find(params[:id])
    end

    def admin_forum_forum_params
      params.require(:forum_forum).permit(:name)
    end

    def require_admin_user
      raise ActiveRecord::RecordNotFound unless admin_user_signed_in?
    end
end
