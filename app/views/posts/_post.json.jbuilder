json.extract! post, :id, :node_id, :content, :post_at, :published, :facebook_id, :created_at, :updated_at
json.url post_url(post, format: :json)
