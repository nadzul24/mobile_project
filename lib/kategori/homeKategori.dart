import 'package:flutter/material.dart';
import '../drawerMenu.dart';

//pendukung program asinkron
class HomeKategori extends StatefulWidget {
  static const kategoriPage = '/homeKategori';
  final email;
  HomeKategori(this.email);
  @override
  HomeKategoriState createState() => HomeKategoriState();
}

class HomeKategoriState extends State<HomeKategori> {
  // DbHelper dbHelper = DbHelper();
  // int count = 0;
  // List<Item> itemList;
  @override
  Widget build(BuildContext context) {
    String us = widget.email;
    // if (itemList == null) {
    //   itemList = List<Item>();
    // }
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kategori'),
        backgroundColor: Colors.yellow[600],
      ),
      drawer: DrawerMenu(us),
      // body: Column(children: [
      //   Expanded(
      //     child: createListView(),
      //   ),
      //   Container(
      //     margin: EdgeInsets.only(bottom: 10),
      //     child: FloatingActionButton(
      //       backgroundColor: Colors.yellow[600],
      //       child: Icon(Icons.add),
      //       onPressed: () async {
      //         var item = await navigateToEntryForm(context, null);
      //         if (item != null) {
      //           //TODO 2 Panggil Fungsi untuk Insert ke DB
      //           int result = await dbHelper.insert(item);
      //           if (result > 0) {
      //             updateListView();
      //           }
      //         }
      //       },
      //     ),
      //   ),
      // ]),
    );
  }
}
