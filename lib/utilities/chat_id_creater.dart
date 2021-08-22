String idCreator(String id1, String id2) {
  if (id1.codeUnitAt(0) > id2.codeUnitAt(0))
    return (id1 + id2);
  else
    return (id2 + id1);
}
