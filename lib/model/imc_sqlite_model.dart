class IMCSQLiteModel {
  int _id = 0;
  String _data = "";
  double _peso = 0;
  double _altura = 0;
  String _imc = "";
  String _desc = "";

  IMCSQLiteModel(this._id, this._peso, this._altura, this._imc, this._data, this._desc);

  int get id => _id;

  String get data => _data;

  double get peso => _peso;

  double get altura => _altura;

  String get imc => _imc;

  String get desc => _desc;

  set id(int id) {
    _id = id;
  }

  set data(String data) {
    _data = data;
  }

  set peso(double peso) {
    _peso = peso;
  }

  set altura(double altura) {
    _altura = altura;
  }

  set imc(String imc) {
    _imc = imc;
  }

  set desc(String desc) {
    _desc = desc;
  }
}
