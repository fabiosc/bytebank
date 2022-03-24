import 'package:bytebank/database/dao/interface_repository.dart';
import 'package:bytebank/models/factory_instance.dart';
import 'package:sqflite/sqflite.dart';
import 'dao.dart';

abstract class GenericRepository<T extends Entity> {
  late final EntityUtil _entityUtil;
  late DatabaseProvider _dbProvider;

  GenericRepository() {
    Entity entity = createInstanceOf<T>() as Entity;
    _entityUtil = entity.getEntityUtil();
    _dbProvider = DatabaseProvider(_entityUtil.getTableSql());
  }

  Future<Database> _getDatabase() async => await _dbProvider.getDatabase();

  Future<int> save(T genericEntity) async {
    if (_entityUtil.isNull(genericEntity)) {
      return -1;
    }
    final Database db = await _getDatabase();
    Map<String, dynamic> genericMap = _entityUtil.toMap(genericEntity);
    return db.insert(_entityUtil.getTableName(), genericMap);
  }

  Future<int> update(T genericEntity) async {
    if (_entityUtil.isNull(genericEntity)) {
      return -1;
    }
    final Database db = await _getDatabase();
    Map<String, dynamic> genericMap = _entityUtil.toMap(genericEntity);
    return db.update(_entityUtil.getTableName(), genericMap,
        where: _entityUtil.getWhereSetence(genericEntity));
  }

  Future<int> delete(T genericEntity) async {
    if (_entityUtil.isNull(genericEntity)) {
      return -1;
    }
    final Database db = await _getDatabase();
    return db.delete(_entityUtil.getTableName(),
        where: _entityUtil.getWhereSetence(genericEntity));
  }

  Future<List<T>> findAll() async {
    final Database db = await _getDatabase();
    final List<Map<String, dynamic>> result =
        await db.query(_entityUtil.getTableName());
    return Future.value(_entityUtil.toList(result) as List<T>);
  }
}
