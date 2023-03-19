import 'package:flutter/material.dart';

import 'package:flutter_app/base/constant.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({Key? key}) : super(key: key);

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future MakeNewPass() async {

    var url = Uri.http(Constant.ipaddress + ":2101", '/mailing_auth/modif.php', {'q': '{http}'});
    print(url.toString());

    if(_usernameController.text == _passwordController.text) {

      var response = await http.post(url, body: {
        "email": Constant.emailSession,
        "password1": _passwordController.text,
      });



      var data = json.decode(response.body);

      print("Message : " + data.toString());

      print("mdp modifier");


    }
    else{
      print("mot de passe non lier");
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
                        hintText: 'Mot de pass',
                        hintStyle: TextStyle(color: HexColor('#3E3D3A')),
                      ),
                      style: TextStyle(color: HexColor('#3E3D3A')),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Verifier Mot de passe',
                        hintStyle: TextStyle(color: HexColor('#3E3D3A')),
                      ),
                      style: TextStyle(color: HexColor('#3E3D3A')),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: MakeNewPass,
                      style: ElevatedButton.styleFrom(
                        primary: HexColor('#947f6b'),
                      ),
                      child: Text('Se connecter', style: TextStyle(color: Colors.white)),
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

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
