import 'package:daftar_buku/buku/EntryFormBuku.dart';
import 'package:daftar_buku/FirestoreDb/Database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import '../drawerMenu.dart';

//pendukung program asinkron
class HomeBuku extends StatefulWidget {
  static const bukuPage = '/homeBuku';
  final email;
  HomeBuku(this.email);
  HomeBukuState createState() => HomeBukuState();
}

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class HomeBukuState extends State<HomeBuku> {
  List<String> listBuku = ["Delete", "Update"];
  String _newValuePerem = "";
  @override
  Widget build(BuildContext context) {
    // String i = widget.id;
    String us = widget.email;

    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Buku'),
        backgroundColor: Colors.yellow[600],
      ),
      drawer: DrawerMenu(us),
      body: Center(
        child: Column(
          children: [
            Expanded(child: fireList(us)),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () async {
                  var buku = await navigateToEntryForm(context, null, null,
                      null, null, null, null, null, null, us, null);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<FirestoreDB> navigateToEntryForm(
      BuildContext context,
      String kategori,
      String title,
      String penulis,
      String penerbit,
      String kota,
      int tahun,
      int price,
      int stock,
      String id,
      String docId) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(kategori, title, penulis, penerbit, kota, tahun, price,
          stock, id, docId);
    }));
    return result;
  }

  StreamBuilder fireList(String a) {
    TextStyle textStyle = Theme.of(context).textTheme.headline5;

    return StreamBuilder<QuerySnapshot>(
      stream: FirestoreDB().readItems(a),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
              alignment: Alignment.center,
              child: Text('Loading',
                  style: TextStyle(fontWeight: FontWeight.bold)));
        } else if (snapshot.hasData || snapshot.data != null) {
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              var noteInfo = snapshot.data.docs[index].data();
              String docID = snapshot.data.docs[index].id;
              String kategori = noteInfo['kategori'];
              String title = noteInfo['title'];
              String penulis = noteInfo['penulis'];
              String penerbit = noteInfo['penerbit'];
              String kota = noteInfo['kota'];
              int tahun = noteInfo['tahun'];
              int price = noteInfo['price'];
              int stock = noteInfo['stock'];

              return Card(
                color: Colors.white,
                elevation: 2.0,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Icon(Icons.book_rounded),
                  ),
                  title: Text(
                    title,
                    style: textStyle,
                  ),
                  subtitle: Text(tahun.toString()),
                  trailing: GestureDetector(
                    child: DropdownButton<String>(
                      underline: SizedBox(),
                      icon: Icon(Icons.menu),
                      items: listBuku.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String changeValue) async {
                        if (changeValue == "Delete") {
                          FirestoreDB.deleteItem(uid: a, docId: docID);
                        } else if (changeValue == "Update") {
                          await navigateToEntryForm(
                              context,
                              kategori,
                              title,
                              penulis,
                              penerbit,
                              kota,
                              tahun,
                              price,
                              stock,
                              a,
                              docID);
                        }
                        ;
                      },
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
