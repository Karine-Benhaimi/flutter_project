import 'package:flutter/material.dart';

import 'package:flutter_app/base/constant.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/new_password.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  TextEditingController _usernameController = TextEditingController();

  Future VerifyPass() async {



    if ( _usernameController.text == Constant.codeSession ) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewPasswordPage() ),
      );
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 150),
            Container(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: 'Nom d\'utilisateur',

                      ),

                    ),
                    SizedBox(height: 20),

                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: VerifyPass,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.brown,
                      ),
                      child: Text('Envoyer', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(height: 20),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
