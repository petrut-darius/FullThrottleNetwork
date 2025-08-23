class AddParentToPost < ActiveRecord::Migration[8.0]
  def change
    add_column :forum_posts, :parent_id, :integer
    add_index :forum_posts, :parent_id
  end
end
