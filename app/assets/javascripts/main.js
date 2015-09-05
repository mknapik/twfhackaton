Array.prototype.inGroupsOf = function(groupSize) {
  var arr, copy, e, group, res, _i, _len;
  arr = this;
  res = [];
  copy = [];
  while (arr.length > 0) {
    group = arr.splice(0, groupSize);
    res.push(group);
    copy = copy.concat(group);
  }
  for (_i = 0, _len = copy.length; _i < _len; _i++) {
    e = copy[_i];
    this.push(e);
  }
  return res;
};
