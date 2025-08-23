json.extract! forum_subforum, :id, :name, :forum_forum_id, :AdminUser_id, :created_at, :updated_at
json.url forum_subforum_url(forum_subforum, format: :json)
