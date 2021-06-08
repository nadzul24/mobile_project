import 'package:daftar_buku/login_page.dart';
import 'package:daftar_buku/sign_in.dart';
import 'package:flutter/material.dart';
import 'buku/homeBuku.dart';
import 'homaPage.dart';
import 'kategori/homeKategori.dart';

class DrawerMenu extends StatelessWidget {
  final user;
  DrawerMenu(this.user);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.yellow[600],
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 120,
                    margin: EdgeInsets.only(
                      top: 15,
                      bottom: 10,
                      left: 15,
                      right: 15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            imageUrl,
                          ),
                          radius: 30,
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(height: 10),
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          email,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(Home.home);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text(
              'Buku',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return HomeBuku(user);
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text(
              'Kategori',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(HomeKategori.kategoriPage);
            },
          ),
          SizedBox(height: 180),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              signOutGoogle();
              if (imageUrl != null) {
                signOutGoogle();
              } else {
                Navigator.of(context).pop();
              }

              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) {
                return LoginPage();
              }), ModalRoute.withName('/'));
            },
          ),
        ],
      ),
    );
  }
}
