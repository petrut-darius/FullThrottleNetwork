json.extract! forum_thread, :id, :name, :forum_subforum_id, :admin_user_id, :forum_forum_id, :created_at, :updated_at
json.url forum_thread_url(forum_thread, format: :json)
