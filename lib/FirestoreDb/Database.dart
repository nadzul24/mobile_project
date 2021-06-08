import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daftar_buku/buku/Buku.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('notes');

class FirestoreDB {
  static String userUid;
  static Future<void> addItem({
    String i,
    String title,
    String penulis,
    String penerbit,
    String kota,
    int tahun,
    int price,
    int stock,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(i).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "penulis": penulis,
      "penerbit": penerbit,
      "kota": kota,
      "tahun": tahun,
      "price": price,
      "stock": stock,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    String uid,
    String title,
    String penulis,
    String penerbit,
    String kota,
    int tahun,
    int price,
    int stock,
    String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(uid).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "price": price,
      "penulis": penulis,
      "penerbit": penerbit,
      "kota": kota,
      "tahun": tahun,
      "stock": stock,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  Stream<QuerySnapshot> readItems(String uid) {
    CollectionReference notesItemCollection =
        _mainCollection.doc(uid).collection('items');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteItem({
    String uid,
    String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(uid).collection('items').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }
}
