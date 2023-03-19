import 'package:flutter/material.dart';
import 'package:flutter_app/client_home_page.dart';
import 'package:flutter_app/admin_home_page.dart';
import 'package:flutter_app/main.dart';

import 'package:flutter_app/base/constant.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;

  Future register() async {

    var url = Uri.http(Constant.ipaddress + ":2101", '/mailing_auth/inscription.php', {'q': '{http}'});
    print(url.toString());

    var response = await http.post(url, body: {
      "email": _username,
      "mdp": _password,
    });


    print("Laura");
    print(response);

    ////String jsonsDataString = response.body.toString();
    // print(jsonsDataString);// Error: toString of Response is assigned to jsonDataString.
    // var _data = jsonDecode(jsonsDataString);
    // print(_data.toString());
    print("lamo");

    var data = json.decode(response.body);

    print( "Message : " + data.toString() );

    if ( data.toString() == "Compte créé avec succès. Veuillez vérifier votre email pour votre QR code de connexion." ) {
      print("lets go");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminHomePage()),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8E1D9),
      appBar: AppBar(title: Text('Créer un compte'),
        backgroundColor: Color(0xFF947F6B),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            color: HexColor('#f8e1d9'),
            image: DecorationImage(
              image: AssetImage('assets/coffee/coffee_6-re.jpg'),
              fit: BoxFit.cover,

            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nom d\'utilisateur'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un nom d\'utilisateur';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _username = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Mot de passe'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un mot de passe';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => register() ,
                  style: ElevatedButton.styleFrom(
                    primary: HexColor('#947f6b'),
                  ),
                  child: Text('Créer un compte', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
