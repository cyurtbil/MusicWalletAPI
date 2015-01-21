json.songs @songs do |song|
  json.id song.id
  json.url song.url
  json.wallet_id song.wallet_id
end