class ForumThread < ApplicationRecord
  belongs_to :forum_subforum
  belongs_to :user
  belongs_to :forum_forum
  has_many :forum_posts
  validates :name, length: { maximum: 20, too_long: "is too long, max %{count} characters" }
  validates :name, presence: true
  validates :content, presence: true
end
