class ForumForumsController < ApplicationController
  before_action :require_admin_user, except: %i[ show index ]
  before_action :set_forum_forum, only: %i[ show]

  # GET /forum_forums or /forum_forums.json
  def index
    @forum_forums = ForumForum.all
  end

  # GET /forum_forums/1 or /forum_forums/1.json
  def show
    @forum_subforums = @forum_forum.forum_subforums
  end

    def set_forum_forum
      @forum_forum = ForumForum.find(params.expect(:id))
    end
end
