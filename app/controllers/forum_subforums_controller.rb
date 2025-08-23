class ForumSubforumsController < ApplicationController
  before_action :require_admin_user, except: %i[show index]
  before_action :set_forum_subforum, only: %i[ show ]

  # GET /forum_subforums or /forum_subforums.json
  def index
    @forum_subforums = ForumSubforum.all
  end

  # GET /forum_subforums/1 or /forum_subforums/1.json
  def show
    @forum_threads = @forum_subforum.forum_threads
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum_subforum
      @forum_subforum = ForumSubforum.find(params.expect(:id))
    end

    def require_admin_user
      if !admin_user_signed_in?
        raise ActiveRecord::RecordNotFound# 404 page
      end
    end
end
