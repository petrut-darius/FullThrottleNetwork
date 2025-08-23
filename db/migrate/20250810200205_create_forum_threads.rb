class CreateForumThreads < ActiveRecord::Migration[8.0]
  def change
    create_table :forum_threads do |t|
      t.string :name, null: false, default: ""
      t.text :content, null: false, default: ""
      t.references :forum_subforum, null: false, foreign_key: true
      t.references :admin_user, null: false, foreign_key: true
      t.references :forum_forum, null: false, foreign_key: true

      t.timestamps
    end
  end
end
