class ForumPost < ApplicationRecord
  belongs_to :forum_subforum
  belongs_to :user
  belongs_to :forum_forum
  belongs_to :forum_thread
  has_many :replies, class_name: "ForumPost", foreign_key: "parent_id", inverse_of: :parent, dependent: :destroy
  belongs_to :parent, class_name: "ForumPost", optional: true
end
