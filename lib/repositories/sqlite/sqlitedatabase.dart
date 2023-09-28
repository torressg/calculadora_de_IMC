import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class SQLiteDataBase {

  static Database? db;
  
  Future<Database> obterDataBase() async{
    if(db == null){
      return await iniciarBD();
    } else {
      return db!;
    }
  }

 Future<Database> iniciarBD() async {
  final databasePath = await getDatabasesPath();
  final path = join(databasePath, 'imc_database.db');

  return await openDatabase(
    path,
    version: 2,
    onCreate: (Database db, int version) async {
      await db.execute(
        'CREATE TABLE imchist(id INTEGER PRIMARY KEY, peso REAL, altura REAL, imc REAL, desc TEXT)',
      );
      print("Tabela imchist criada com sucesso.");
    },
    onUpgrade: (Database db, int oldVersion, int newVersion) async {
      if (oldVersion < 2) {
        await db.execute(
          'ALTER TABLE imchist ADD COLUMN data TEXT',
        );
        print("Coluna 'data' adicionada com sucesso.");
      }
    },
  );
} 
}