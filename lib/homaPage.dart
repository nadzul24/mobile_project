import 'package:daftar_buku/drawerMenu.dart';
import 'package:daftar_buku/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final user;
  Home(this.user);
  static const home = '/home';
  @override
  Widget build(BuildContext context) {
    String us = user;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.yellow[600],
      ),
      drawer: DrawerMenu(us),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 24.0, right: 24.0),
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Hello.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(width: 16),
                      // Expanded(
                      //   child: Divider(thickness: 3, color: Colors.black),
                      // ),
                      SizedBox(width: 40),
                    ],
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    // style: TextStyle(
                    //     color: Colors.black,
                    //     fontWeight: FontWeight.w600,
                    //     fontSize: 20,
                    // letterSpacing: 5),
                  ),
                  Expanded(
                    child: Divider(thickness: 1, color: Colors.black),
                  ),
                  // Spasi
                  SizedBox(height: 30),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 80,
                        height: 100,
                        margin: EdgeInsets.only(
                          top: 15,
                          bottom: 10,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.amber,
                            child: Icon(Icons.book, color: Colors.white),
                          ),
                        ),
                      ),
                      Text(
                        'App Home Page',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
