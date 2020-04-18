import 'package:crab/model/ServerInfo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String table = 'server';
final String columnId = 'id';
final String columnName = 'name';
final String columnUrl = 'url';
final String columnIsSelected = 'isSelected';

class ServerInfo {
  int id;
  String name;
  String url;
  bool isSelected;

  ServerInfo({this.id, this.name, this.url, this.isSelected});

  @override
  String toString() {
    return '[$id, $name, $url, $isSelected]';
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnUrl: url,
      columnIsSelected: isSelected
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  ServerInfo.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    url = map[columnUrl];
    isSelected = map[columnIsSelected];
  }
}

class ServerDBHelper {
  Database database;

  ServerDBHelper() {
    open();
  }

  void open() async {
    database = await openDatabase(join(await getDatabasesPath(), 'server.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('create table $table (' +
          '$columnId integer parimary key autoincrement, ' +
          '$columnName varchar(255) not null, ' +
          '$columnUrl varchar(255) not null, ' +
          '$columnIsSelected boolean)');
    });
  }

  Future insert(ServerInfo serverInfo) async {
    serverInfo.id = await database.insert(table, serverInfo.toMap());
    return serverInfo;
  }

  Future<ServerInfo> selectById(int id) async {
    List<Map> maps = await database.query(table,
        columns: [columnId, columnName, columnUrl, columnIsSelected],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return ServerInfo.fromMap(maps.first);
    }
    return null;
  }

  Future<List<ServerInfo>> selectAll() async {
    List<Map> maps = await database.query(table);
    List<ServerInfo> list = new List();
    for (int i = 0; i < maps.length; i++) {
      list.add(ServerInfo.fromMap(maps[i]));
    }
    return list;
  }

  Future<int> delete(int id) async {
    return await database
        .delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(ServerInfo serverInfo) async {
    return await database.update(table, serverInfo.toMap(),
        where: '$columnId = ?', whereArgs: [serverInfo.id]);
  }

  Future colse() async => database.close();
}
