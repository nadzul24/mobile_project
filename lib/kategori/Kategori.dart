class Kategori {
  int _id;
  String _kategori;
  String _idUser;
  int get id => _id;
  String get kategori => this._kategori;
  set kategori(String value) => this._kategori = value;
  get idUser => this._idUser;
  set idUser(value) => this._idUser = value;

// konstruktor versi 1
  Kategori(this._kategori, this._idUser);
// konstruktor versi 2: konversi dari Map ke Item
  Kategori.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._kategori = map['kategori'];
    this._idUser = map['idUser'];
  }
  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['kategori'] = kategori;
    map['idUser'] = idUser;
    return map;
  }
}
