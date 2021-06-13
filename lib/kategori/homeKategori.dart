import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daftar_buku/FirestoreDb/Database.dart';
import 'package:flutter/material.dart';
import '../drawerMenu.dart';
import 'EntryFormKategori.dart';

//pendukung program asinkron
class HomeKategori extends StatefulWidget {
  static const kategoriPage = '/homeKategori';
  final email;
  HomeKategori(this.email);

  HomeKategoriState createState() => HomeKategoriState();
}

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class HomeKategoriState extends State<HomeKategori> {
  List<String> listKategori = ["Delete", "Update"];
  String _newValuePerem = "";
  @override
  Widget build(BuildContext context) {
    String us = widget.email;

    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kategori'),
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
                  var kategori = await navigateToEntryFormKategori(
                      context, null, us, null);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<FirestoreDB> navigateToEntryFormKategori(
      BuildContext context, String kategori, String id, String docId) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(kategori, id, docId);
    }));
    return result;
  }

  StreamBuilder fireList(String a) {
    TextStyle textStyle = Theme.of(context).textTheme.headline5;

    return StreamBuilder<QuerySnapshot>(
      stream: FirestoreDB().readKategori(a),
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

              return Card(
                color: Colors.white,
                elevation: 2.0,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Icon(Icons.book_rounded),
                  ),
                  title: Text(
                    kategori,
                    style: textStyle,
                  ),
                  subtitle: Text(kategori),
                  trailing: GestureDetector(
                    child: DropdownButton<String>(
                      underline: SizedBox(),
                      icon: Icon(Icons.menu),
                      items: listKategori.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String changeValue) async {
                        if (changeValue == "Delete") {
                          FirestoreDB.deleteKategori(uid: a, docId: docID);
                        } else if (changeValue == "Update") {
                          await navigateToEntryFormKategori(
                              context, kategori, a, docID);
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
