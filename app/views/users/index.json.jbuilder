json.users @users do |user|
  json.id user.id
  json.username user.username
  json.token user.token
  json.image_url user.image_url
  json.followings_count user.followings_count
  json.followers_count user.followers_count
  json.wallets user.wallets do |wallet|
    json.id wallet.id
    json.name wallet.name
    json.user_id wallet.user_id
    json.songs wallet.songs
  end
end