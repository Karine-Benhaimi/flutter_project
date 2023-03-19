import "package:flutter/material.dart";


import 'package:flutter_app/base/constant.dart';
import 'package:flutter_app/verification.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class ModifPage extends StatefulWidget {
  const ModifPage({Key? key}) : super(key: key);

  @override
  State<ModifPage> createState() => _ModifPageState();
}

class _ModifPageState extends State<ModifPage> {
  TextEditingController _usernameController = TextEditingController();

  Future modifpassword() async {

    var url = Uri.http(Constant.ipaddress + ":2101", '/mailing_auth/recup.php', {'q': '{http}'});
    print(url.toString());

    var response = await http.post(url, body: {
      "email": _usernameController.text,
    });


    var data = json.decode(response.body);

    print( "Message : " + data.toString() );
    Constant.codeSession = data.toString();
    Constant.emailSession = _usernameController.text;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VerificationPage()),
    );

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
                      onPressed: modifpassword,
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
