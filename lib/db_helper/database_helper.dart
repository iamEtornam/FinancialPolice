import 'package:financial_police/model/category.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

final String tableCategory = 'categoryTable';
final String columnId = 'id';
final String columnName = 'name';
final String columnTimestamp = 'timestamp';
static Database _db;

DatabaseHelper.internal();

Future<Database> get db async{
  if(_db != null){
    return _db;
  }
  _db = await initDb();
  return _db;
}

initDb() async{
  String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'financialpolice.db');

    await deleteDatabase(path); // just for testing
 
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
}

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableCategory($columnId INTEGER PRIMARY KEY, $columnName TEXT, $columnTimestamp TEXT)');
  }

   Future<int> saveCategory(Category category) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableCategory, category.toMap());

    return result;
  }

   Future<List> getAllCategory() async {
    var dbClient = await db;
    var result = await dbClient.query(tableCategory, columns: [columnId, columnName, columnTimestamp]);
 
    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(*) FROM $tableCategory'));
  }

  Future<Category> getCategory(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableCategory,
        columns: [columnId, columnName, columnTimestamp],
        where: '$columnId = ?',
        whereArgs: [id]);
 
    if (result.length > 0) {
      return new Category.fromMap(result.first);
    }
 
    return null;
  }

  Future<int> deleteCategory(int id) async {
    var dbClient = await db;
    return await dbClient.delete(tableCategory, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> updateCategoty(Category category) async {
    var dbClient = await db;
    return await dbClient.update(tableCategory, category.toMap(), where: "$columnId = ?", whereArgs: [category.id]);

  }
 
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

}