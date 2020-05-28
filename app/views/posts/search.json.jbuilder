json.array! @posts do |post|
  json.id post.id
  json.content post.content
  json.image post.image
  json.user_id post.user_id
  json.address post.address
  json.latitude post.latitude
  json.longitude post.longitude
  json.title post.title
  json.category post.category_id
  json.created_at post.created_at
  json.updated_at post.updated_at
  # json.nickname post.user.nickname
  # json.user_sign_in current_user
end