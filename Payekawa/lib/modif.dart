import "package:flutter/material.dart";
import 'package:payekawa/new_password.dart';

import 'package:payekawa/products/products_home_screen.dart';
import 'package:payekawa/clients.dart';
import 'package:payekawa/commandes.dart';
import 'package:payekawa/profil.dart';
import 'package:payekawa/admin_home_page.dart';
import 'package:payekawa/client_home_page.dart';
import 'package:payekawa/register_page.dart';
import 'package:payekawa/base/constant.dart';
import 'package:payekawa/modif.dart';
import 'package:payekawa/verification.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class ModifPage extends StatefulWidget {
  const ModifPage({Key? key}) : super(key: key);

  @override
  State<ModifPage> createState() => _ModifPageState();
}

class _ModifPageState extends State<ModifPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _codeController = TextEditingController();

  Future VerifyPass() async {

    if ( _codeController.text == Constant.codeSession ) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewPasswordPage() ),
      );
    }

  }

  Future modifpassword() async {

    if(_usernameController.text != "") {
      var url = Uri.http(
          Constant.ipaddress + ":2101", '/mailing_auth/recup.php',
          {'q': '{http}'});
      print(url.toString());

      var response = await http.post(url, body: {
        "email": _usernameController.text,
      });


      var data = json.decode(response.body);

      print("Message : " + data.toString());
      Constant.codeSession = data.toString();
      Constant.emailSession = _usernameController.text;

      showDialog(
        context: context,
        builder: (BuildContext context) => _buildPopupDialog2(context),
      );

    }
    else {

      showDialog(
        context: context,
        builder: (BuildContext context) => _buildPopupDialog1(context,"Vous n'avez pas taper votre email"),
      );
      
    }


    }



  void verifCode()
  {
    if ( _codeController.text == Constant.codeSession ) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewPasswordPage() ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {

                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 35),
                Column(
                  children: [
                    Center(
                      child: Container(
                        height: 100,
                          child: Image.asset('assets/images/mail.png')),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: 300,
                      child: Column(
                        children: [
                          Text(
                            'Mot de passe oublier?\nPas de problème!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Entrer votre email puis appuyez le bouton envover pour recevoir un code',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Color(0xff718193),
                            ),
                          ),
                          SizedBox(height: 30),
                          Divider(
                            color: Color(0xffCAE4F1),
                            indent: 100,
                            endIndent: 100,
                            thickness: 5,
                          ),
                          SizedBox(height: 50),
                          Text(
                            'Entrez votre email',

                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Color(0xff718193),
                            ),
                          ),
                          Row(
                            children: [

                              textField("Email",false,_usernameController,209),
                              SizedBox(width: 10),
                              Container(
                                height: 38,
                                width: 72,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(29),
                                  color: Color(0xffA1670B),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffA1670B).withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: GestureDetector(
                                  child: Center(
                                    child: Text(
                                      '>>',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),

                                  onTap: () => {
                                    modifpassword()
                                  },
                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Entrez le code',

                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Color(0xff718193),
                            ),
                          ),
                          Row(
                            children: [
                              textField("Code", true,_codeController,279),
                              Container(
                                height: 38,
                                width: 7,)
                            ],
                          ),


                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: verifCode,
                            style: ElevatedButton.styleFrom(
                              primary: HexColor('#947f6b'),
                            ),
                            child: Text('Se connecter', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
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
          Center(child: Image.asset('assets/images/mail.png')),
          SizedBox(height: 15),
          Center(
            child: Text(
              "Envoyer!",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 19,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Parfait! un email à étè envoyez à votre addresse email.",
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
