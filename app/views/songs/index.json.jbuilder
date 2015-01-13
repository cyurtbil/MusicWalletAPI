json.songs @songs do |song|
  json.id song.id
  json.name song.name
  json.wallet_id song.wallet_id
end