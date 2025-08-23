class ForumThreadsController < ApplicationController
  before_action :set_forum_thread, only: %i[ show edit update destroy ]

  # GET /forum_threads or /forum_threads.json
  def index
    @forum_threads = ForumThread.all
  end

  # GET /forum_threads/1 or /forum_threads/1.json
  def show
    @post = ForumPost.new
    @posts = @forum_thread.forum_posts
  end

  # GET /forum_threads/new
  def new
    @forum_thread = ForumThread.new
  end

  # GET /forum_threads/1/edit
  def edit
  end

  # POST /forum_threads or /forum_threads.json
  def create
    @forum_thread = ForumThread.new(forum_thread_params)
    @forum_thread.user = current_user
    @forum_thread.forum_forum = @forum_thread.forum_subforum.forum_forum
    respond_to do |format|
      if @forum_thread.save
        format.html { redirect_to @forum_thread, notice: "Forum thread was successfully created." }
        format.json { render :show, status: :created, location: @forum_thread }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @forum_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forum_threads/1 or /forum_threads/1.json
  def update
    respond_to do |format|
      if @forum_thread.update(forum_thread_params)
        format.html { redirect_to @forum_thread, notice: "Forum thread was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @forum_thread }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @forum_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forum_threads/1 or /forum_threads/1.json
  def destroy
    @forum_thread.destroy!

    respond_to do |format|
      format.html { redirect_to forum_threads_path, notice: "Forum thread was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum_thread
      @forum_thread = ForumThread.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def forum_thread_params
      params.expect(forum_thread: [ :name, :content, :forum_subforum_id ])
    end
end
