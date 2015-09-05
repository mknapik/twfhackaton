Array.prototype.inGroupsOf = (groupSize) ->
  arr = this
  res = []
  copy = []

  while (arr.length > 0)
    group = arr.splice(0, groupSize)

    res.push(group)
    copy = copy.concat(group)

  this.push e for e in copy

  res