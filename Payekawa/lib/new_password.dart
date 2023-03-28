import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:payekawa/main.dart';
import 'package:payekawa/products/products_home_screen.dart';
import 'package:payekawa/clients.dart';
import 'package:payekawa/commandes.dart';
import 'package:payekawa/profil.dart';
import 'package:payekawa/admin_home_page.dart';
import 'package:payekawa/client_home_page.dart';
import 'package:payekawa/register_page.dart';
import 'package:payekawa/base/constant.dart';
import 'package:payekawa/modif.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({Key? key}) : super(key: key);

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  TextEditingController _passwordController1 = TextEditingController();
  TextEditingController _passwordController2 = TextEditingController();

  Future MakeNewPass() async {

    var url = Uri.http(Constant.ipaddress + ":2101", '/mailing_auth/modif.php', {'q': '{http}'});
    print(url.toString());

    if(_passwordController1.text == _passwordController2.text) {

      var response = await http.post(url, body: {
        "email": Constant.emailSession,
        "password1": _passwordController1.text,
      });


      var data = json.decode(response.body);

      print("Message : " + data.toString());

      print("mdp modifier");

      showDialog(
        context: context,
        builder: (BuildContext context) => _buildPopupDialog2(context),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage() ),
      );


    }
    else{
      showDialog(
        context: context,
        builder: (BuildContext context) => _buildPopupDialog1(context,"Les mots de passe sont différentes, veuillez saisir le meme mot de passe"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
        height: 400,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              textField("Nouveau mot de passe",false,_passwordController1,289),
              SizedBox(height: 30,),
              textField("Confirmer nouveau mot de passe",false,_passwordController2,289),
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: MakeNewPass,
                style: ElevatedButton.styleFrom(
                  primary: HexColor('#947f6b'),
                ),
                child: Text('Se connecter', style: TextStyle(color: Colors.white)),
              ),

            ],
          ),
    )
    )
    );
  }

  Widget textField(tag, string,_controller, double width) => Container(
    width: width,
    height: 48,
    child: TextField(
      controller: _controller,
      obscureText: string,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
        ),
        labelText: tag,
        labelStyle: TextStyle(color: Color(0xfffc718193), fontSize: 15),
        contentPadding: EdgeInsetsDirectional.only(start: 20),
      ),
    ),
  );

  Widget _buildPopupDialog1(BuildContext context,String error) {
    final maxLines = 1;

    return new AlertDialog(
      content: SingleChildScrollView(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "System Error",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Color(0xffDD4B39),
              ),
            ),
            SizedBox(height: 15),
            Text(
              error,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Color(0xff718193),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }

  Widget _buildPopupDialog2(BuildContext context) {
    return new AlertDialog(
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(child: Image.asset('images/check.png')),
          SizedBox(height: 15),
          Center(
            child: Text(
              "C'est fait!",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 19,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Votre mot de passe a étè réinitialiser",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
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
