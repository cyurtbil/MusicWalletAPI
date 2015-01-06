json.users @users do |user|
  json.id user.id
  json.username user.username
  json.image_url user.image_url
  json.followings_count user.followings_count
  json.followers_count user.followers_count
end