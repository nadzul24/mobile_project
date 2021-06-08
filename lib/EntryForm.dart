import 'package:daftar_buku/FirestoreDb/Database.dart';
import 'package:flutter/material.dart';
import 'FirestoreDb/Database.dart';

class EntryForm extends StatefulWidget {
  final String title;
  final String penulis;
  final String penerbit;
  final String kota;
  final int tahun;
  final int price;
  final int stock;
  final String id;
  final String docId;

  EntryForm(this.title, this.penulis, this.penerbit, this.kota, this.tahun,
      this.price, this.stock, this.id, this.docId);
  @override
  EntryFormState createState() => EntryFormState(this.title, this.penulis,
      this.penerbit, this.kota, this.tahun, this.price, this.stock, id, docId);
}

//class controller
class EntryFormState extends State<EntryForm> {
  String title;
  String penulis;
  String penerbit;
  String kota;
  int tahun;
  int price;
  int stock;
  String id;
  String docId;

  EntryFormState(this.title, this.penulis, this.penerbit, this.kota, this.tahun,
      this.price, this.stock, this.id, this.docId);

  TextEditingController titleController = TextEditingController();
  TextEditingController penulisController = TextEditingController();
  TextEditingController penerbitController = TextEditingController();
  TextEditingController kotaController = TextEditingController();
  TextEditingController tahunController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController stockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //kondisi
    if (title != null) {
      titleController.text = title;
      penulisController.text = penulis;
      penerbitController.text = penerbit;
      kotaController.text = kota;
      tahunController.text = tahun.toString();
      priceController.text = price.toString();
      stockController.text = stock.toString();
    }
    //rubah
    return Scaffold(
        appBar: AppBar(
          title: Text('Tambah Buku'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              // judul
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: TextField(
                  controller: titleController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Judul Buku',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // Nama Penulis
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: TextField(
                  controller: penulisController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Penulis',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // Penerbit
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: TextField(
                  controller: penerbitController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Penerbit',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // KOTA + TAHUN TERBIT
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Row(
                  children: [
                    //Kota Penerbit
                    Expanded(
                      child: TextField(
                        controller: kotaController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Kota Penerbit',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (value) {
                          //
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      // Tahun terbit
                      child: TextField(
                        controller: tahunController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Tahun Terbit',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (value) {
                          //
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // harga
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Harga',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              //stock
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: TextField(
                  controller: stockController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Stock',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // tombol button
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    // tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (title == null) {
                            // tambah data
                            FirestoreDB.addItem(
                                i: id,
                                title: titleController.text,
                                penulis: penulisController.text,
                                penerbit: penerbitController.text,
                                kota: kotaController.text,
                                tahun: int.parse(tahunController.text),
                                price: int.parse(priceController.text),
                                stock: int.parse(stockController.text));
                          } else {
                            // ubah data
                            FirestoreDB.updateItem(
                                uid: id,
                                title: titleController.text,
                                penulis: penulisController.text,
                                penerbit: penerbitController.text,
                                kota: kotaController.text,
                                tahun: int.parse(tahunController.text),
                                price: int.parse(priceController.text),
                                stock: int.parse(stockController.text),
                                docId: docId);
                          }
                          // kembali ke layar sebelumnya dengan membawa objek item
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    // tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
