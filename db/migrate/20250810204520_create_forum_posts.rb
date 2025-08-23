class CreateForumPosts < ActiveRecord::Migration[8.0]
  def change
    create_table :forum_posts do |t|
      t.text :content
      t.references :forum_subforum, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :forum_forum, null: false, foreign_key: true
      t.references :forum_thread, null: false, foreign_key: true

      t.timestamps
    end
  end
end
