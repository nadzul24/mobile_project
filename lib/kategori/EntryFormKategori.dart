import 'package:daftar_buku/FirestoreDb/Database.dart';
import 'package:flutter/material.dart';
import '../FirestoreDb/Database.dart';

class EntryForm extends StatefulWidget {
  final String kategori;
  final String id;
  final String docId;

  EntryForm(this.kategori, this.id, this.docId);
  @override
  EntryFormState createState() => EntryFormState(this.kategori, id, docId);
}

//class controller
class EntryFormState extends State<EntryForm> {
  String kategori;
  String id;
  String docId;

  EntryFormState(this.kategori, this.id, this.docId);

  TextEditingController katController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //kondisi
    if (kategori != null) {
      katController.text = kategori;
    }
    //rubah
    return Scaffold(
        appBar: AppBar(
          title: Text('Tambah Kategori'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              // Kategori
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: TextField(
                  controller: katController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Kategori Buku',
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
                          if (kategori == null) {
                            // tambah data
                            FirestoreDB.addKategori(
                              i: id,
                              kategori: katController.text,
                            );
                          } else {
                            // ubah data
                            FirestoreDB.updateKategori(
                                uid: id,
                                kategori: katController.text,
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
