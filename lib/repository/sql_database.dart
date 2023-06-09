import 'package:morning_diary/models/sample.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//데이터베이스 생성과 스키마 선언

class SqlDataBase {
  static final SqlDataBase instance = SqlDataBase._instance();

  Database? _database;

  SqlDataBase._instance() {
    _initDataBase();
  }

  factory SqlDataBase() {
    return instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    await _initDataBase();
    return _database!;
  }

  Future<void> _initDataBase() async {
    var dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'sample.db');
    _database = await openDatabase(path, version: 1, onCreate: _databaseCreate);
  }

  //sql스키마 대로 db생성
  void _databaseCreate(Database db, int version) async {
    await db.execute('''
      create table ${Sample.tableName} (
        ${SampleFields.promiseAns} text,
        ${SampleFields.planAns} text,
        ${SampleFields.createAt} text not null
      )
    ''');
  }

  void closeDataBase() async {
    if (Database != null) await _database!.close();
  }
}
