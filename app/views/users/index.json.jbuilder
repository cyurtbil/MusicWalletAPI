json.users @users do |user|
  json.id user.id
  json.username user.username
  json.token user.token
  json.wallets user.wallets do |wallet|
    json.id wallet.id
    json.name wallet.name
    json.user_id wallet.user_id
    json.songs wallet.songs
    json.song_count wallet.songs.length
  end
end