import 'package:daftar_buku/first_screen.dart';
import 'package:daftar_buku/register_page.dart';
import 'package:daftar_buku/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'FirestoreDb/Database.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Welcome.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Divider(thickness: 3, color: Colors.black),
                  ),
                  SizedBox(width: 40),
                ],
              ),
              Text(
                'Daftar Buku App',
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.w600,
                    fontSize: 36,
                    letterSpacing: 5),
              ),
              // Spasi
              SizedBox(height: 30),
              // Icon
              Icon(Icons.book, size: 100, color: Colors.amber),
              SizedBox(height: 30),
              _formLogin(),
              _signInButton(),
              _register(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formLogin() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Email',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Enter Email',
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.black26,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Password',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: _passController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Enter Password',
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.black26,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  signInWithEmailAndPassword(
                          _emailController.text, _passController.text)
                      .then((result) {
                    if (result != null) {
                      FirestoreDB.userUid = _auth.currentUser.uid;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return FirstScreen();
                          },
                        ),
                      );
                    }
                  });
                }
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              color: Color(0xFF4f4f4f),
              elevation: 0,
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: Colors.black54,
                ),
              ),
              SizedBox(width: 20),
              Text(
                'OR',
                style: TextStyle(color: Colors.black54),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _register() {
    return FlatButton(
      child: Text(
        'Don\’t have account? Register here',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () async {
        Navigator.of(context).pushNamed(RegisterPage.tag);
      },
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.black,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            FirestoreDB.userUid = _auth.currentUser.uid;
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return FirstScreen();
                },
              ),
            );
            SizedBox(height: 20);
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
