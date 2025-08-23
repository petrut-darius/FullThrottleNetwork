class CreateForumForums < ActiveRecord::Migration[8.0]
  def change
    create_table :forum_forums do |t|
      t.string :name
      t.references :admin_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
