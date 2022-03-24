import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {

  final String _tableSql;

  DatabaseProvider(this._tableSql);

  Future<Database> getDatabase() async {
    final String path = join(await getDatabasesPath(), 'bytebank.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(_tableSql);
      },
      version: 1,
      onDowngrade: onDatabaseDowngradeDelete
    );
  }
}

