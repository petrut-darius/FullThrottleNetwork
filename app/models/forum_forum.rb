class ForumForum < ApplicationRecord
  belongs_to :admin_user
  has_many :forum_subforums
  has_many :forum_threads
  has_many :forums_posts
  validates :name, length: { maximum: 20, too_long: "is too long, max %{count} characters" }
end
