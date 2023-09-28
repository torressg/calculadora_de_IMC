import 'package:calculadora_de_imc/model/imc_sqlite_model.dart';
import 'package:calculadora_de_imc/repositories/sqlite/sqlitedatabase.dart';

class IMCSQLiteRepository {
  Future <List<IMCSQLiteModel>> obterDados () async {
    List<IMCSQLiteModel> imcs = [];
    var db = await SQLiteDataBase().obterDataBase();
    var result = await db.rawQuery('SELECT id, peso, altura, imc, desc, data FROM imchist;');
    for (var element in result) {
      imcs.add(
        IMCSQLiteModel(
          int.parse(element["id"].toString()), 
          double.parse(["peso"].toString()),
          double.parse(element["altura"].toString()), 
          element["imc"].toString(), 
          element["data"].toString(), 
          element["desc"].toString()
        )
      );
    }
    return imcs;
  }

  Future<void> salvar(IMCSQLiteModel imcsqLiteModel) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert("INSERT INTO imchist (peso, altura, imc, desc, data) values(?, ?)",
      [
        imcsqLiteModel.peso,
        imcsqLiteModel.altura,
        imcsqLiteModel.imc,
        imcsqLiteModel.desc,
        imcsqLiteModel.data
      ]
    );
  }
}