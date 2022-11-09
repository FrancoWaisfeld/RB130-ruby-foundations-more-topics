def grouping(collection)
  yield(collection)
end

birds = %w(raven finch hawk eagle)

grouping(birds) do | _, _, *raptors |
  p raptors
end
