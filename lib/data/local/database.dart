import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get age => integer()();
}

@UseMoor(tables: [Users])
class MyDatabase extends _$MyDatabase {
  MyDatabase()
      : super(
          FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite',
            logStatements: true,
          ),
        );

  @override
  int get schemaVersion => 1;

  Future<List<User>> getAllUsers() => select(users).get();

  Future<void> saveUser(UsersCompanion user) {
    return into(users).insert(user);
  }

  Future<void> clearDatabase() async {
    await delete(users).go();
  }

  Future<int> countUsers() async {
    return (await select(users).get()).length;
  }
}
