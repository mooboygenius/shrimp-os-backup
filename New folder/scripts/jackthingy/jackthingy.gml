function createWindowInstance(x, y, depth, object, pw=self) {
  /// @function createWindowInstance(x, y, depth, object,     [parentWindow])
  var inst=instance_create_depth(x, y, depth, object);
  with inst {
    parentWindow=pw;
  }
  with pw {
    ds_list_insert(children, 0, inst);
  }
  return inst;
}
