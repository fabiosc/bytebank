
abstract class InterfaceRepository<T> {
  Future<int> save(dynamic genericEntity);
  Future<List<dynamic>> findAll();
}

abstract class Entity {
  EntityUtil getEntityUtil();
}

abstract class EntityUtil<T> {
  String getTableName();
  String getTableSql();
  String getWhereSetence(T genericEntity);

  bool isNull(T genericEntity);
  Map<String, dynamic> toMap(T genericEntity);
  List<T> toList(List<Map<String, dynamic>> result);
}
