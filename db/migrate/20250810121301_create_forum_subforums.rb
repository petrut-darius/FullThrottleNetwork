class CreateForumSubforums < ActiveRecord::Migration[8.0]
  def change
    create_table :forum_subforums do |t|
      t.string :name, null: false, default: ""
      t.references :forum_forum, null: false, foreign_key: true
      t.references :admin_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
