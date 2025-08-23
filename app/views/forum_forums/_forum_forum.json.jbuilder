json.extract! forum_forum, :id, :name, :admin_user_id, :created_at, :updated_at
json.url forum_forum_url(forum_forum, format: :json)
