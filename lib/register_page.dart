import 'package:daftar_buku/first_screen.dart';
import 'package:daftar_buku/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  static String tag = 'register-page';
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegisterPage> {
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
              SizedBox(height: 48),
              _formRegis(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formRegis() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Email',
            style: TextStyle(color: Colors.black54),
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
                  color: Colors.black54,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Password',
            style: TextStyle(color: Colors.black54),
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
                  color: Colors.black54,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.center,
                child: OutlineButton(
                  splashColor: Colors.grey,
                  color: Colors.blueGrey,
                  onPressed: () {
                    createUserWithEmailAndPassword(
                            _emailController.text, _passController.text)
                        .then((result) {
                      if (result != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return FirstScreen();
                            },
                          ),
                        );
                      }
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  highlightElevation: 0,
                  borderSide: BorderSide(
                    color: Color(0xFF4f4f4f),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF4f4f4f),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.center,
                child: OutlineButton(
                  splashColor: Color(0xFF4f4f4f),
                  color: Color(0xFF4f4f4f),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  highlightElevation: 0,
                  borderSide: BorderSide(
                    color: Color(0xFF4f4f4f),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF4f4f4f),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
