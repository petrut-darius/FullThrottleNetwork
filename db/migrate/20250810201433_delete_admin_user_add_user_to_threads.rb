class DeleteAdminUserAddUserToThreads < ActiveRecord::Migration[8.0]
  def change
    remove_column :forum_threads, :admin_user_id
    add_reference :forum_threads, :user, foreign_key: true
  end
end
