json.extract! vote_post, :id, :user_id, :post_id, :type, :created_at, :updated_at
json.url vote_post_url(vote_post, format: :json)
