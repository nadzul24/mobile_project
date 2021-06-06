import 'package:daftar_buku/buku/homeBuku.dart';
import 'package:daftar_buku/register_page.dart';
import 'package:flutter/material.dart';
import 'homaPage.dart';
import 'kategori/homeKategori.dart';
import 'login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  final routes = <String, WidgetBuilder>{
    RegisterPage.tag: (context) => RegisterPage(),
  };
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
        Home.home: (_) => Home(),
        HomeBuku.bukuPage: (_) => HomeBuku(),
        HomeKategori.kategoriPage: (_) => HomeKategori(),
      },
    );
  }
}
