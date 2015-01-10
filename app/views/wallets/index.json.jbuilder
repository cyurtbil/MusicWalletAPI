json.wallets @wallets do |wallet|
  json.id wallet.id
  json.name wallet.name
  json.user_id wallet.user_id
  json.songs wallet.songs
end