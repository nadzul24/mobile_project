import 'package:daftar_buku/buku/homeBuku.dart';
import 'package:daftar_buku/register_page.dart';
import 'package:daftar_buku/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'homaPage.dart';
import 'kategori/homeKategori.dart';
import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  final routes = <String, WidgetBuilder>{
    RegisterPage.tag: (context) => RegisterPage(),
  };
  String us;
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Login',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: LoginPage(),
      routes: {
        RegisterPage.tag: (context) => RegisterPage(),
        Home.home: (_) => Home(us),
        HomeBuku.bukuPage: (_) => HomeBuku(us),
        HomeKategori.kategoriPage: (_) => HomeKategori(us),
      },
    );
  }
}
