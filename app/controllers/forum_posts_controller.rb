class ForumPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_forum_thread
  def create
    @forum_post = ForumPost.new(forum_post_params)
    @forum_post.user = current_user
    @forum_post.forum_subforum = @forum_thread.forum_subforum
    @forum_post.forum_forum =  @forum_thread.forum_forum
    @forum_post.forum_thread = @forum_thread

    respond_to do |format|
      if @forum_post.save
        format.html { redirect_to @forum_thread, notice: "Forum post was successfully created." }
        format.json { render :show, status: :created, location: @forum_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @forum_post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum_post
      @forum_post = ForumPost.find(params.expect(:id))
    end

    def set_forum_thread
      @forum_thread = ForumThread.find(params[:forum_thread_id])
    end
    # Only allow a list of trusted parameters through.
    def forum_post_params
      params.expect(forum_post: [ :content, :parent_id ])
    end
end
