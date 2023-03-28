import 'package:flutter/material.dart';
import 'package:payekawa/client_home_page.dart';
import 'package:payekawa/admin_home_page.dart';
import 'package:payekawa/main.dart';

import 'package:payekawa/base/constant.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payekawa/success.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();
  TextEditingController _nomController      = TextEditingController();

  bool triedLogin = false;


  Future register() async {

    if( _usernameController.text == "" && _passwordController.text == ""
    && _nomController.text == "" && _passwordConfirmController.text == "") {

    }
     else if( !_usernameController.text.contains("@") )
      {
        showDialog(
          context: context,
          builder: (BuildContext context) => _buildPopupDialog1(context,"L'email n'es pas au bon format'"),
        );
      }
     else if(_passwordController.text != _passwordConfirmController)
       {
         showDialog(
           context: context,
           builder: (BuildContext context) => _buildPopupDialog1(context,"Les mot de passe ne correspond pas entre elles"),
         );

       }
     else
       {
         var url = Uri.http(Constant.ipaddress + ":2101", '/mailing_auth/inscription.php', {'q': '{http}'});
         print(url.toString());

         print("user : " + _usernameController.text);

         var response = await http.post(url, body: {
           "email": _usernameController.text.toString(),
           "fullname": _nomController.text.toString(),
           "mdp": _passwordController.text.toString(),
         });


         print("Laura");
         print(response);

         ////String jsonsDataString = response.body.toString();
         // print(jsonsDataString);// Error: toString of Response is assigned to jsonDataString.
         // var _data = jsonDecode(jsonsDataString);
         // print(_data.toString());
         print("lamo");

         var data = json.decode(response.body);

         print("Message : " + data.toString());

         if (data.toString() == "Success") {

           Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => SuccessPage()),
           );
         }
       }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe08b3e),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {

          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 28,
          ),
        ),


      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Container(
                  height: 445,
                  width: 327,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 5,
                        //offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Text(
                          'Inscription',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff2E2E2E),
                          ),
                        ),
                      ),
                      textField("Nom Complet", false,_nomController),
                      SizedBox(
                        height: 20,
                      ),
                      textField("Email", false,_usernameController),
                      SizedBox(
                        height: 20,
                      ),
                      textField("mot de passe", true,_passwordController),
                      SizedBox(
                        height: 20,
                      ),
                      textField("confirmer mot de passe", true,_passwordConfirmController),
                      SizedBox(
                        height: 43,
                      ),
                      Text(
                        'En creant un compte vous approuver nos',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff718193),
                            fontSize: 11),
                      ),
                      Text(
                        "conditions générales d'utilisation",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff718193),
                            fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 58,
                width: 342,
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
                      'Crée un compte',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  onTap: () => {
                  setState(() {
                  triedLogin = true;
                  }),
                  register()
                  },
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'déjà un compte?',
                    style: TextStyle(
                        color: Color(0xff718193), fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  GestureDetector(
                    child: Text(
                      'connectez-vous',
                      style: TextStyle(
                          color: Color(0xffA1670B), fontWeight: FontWeight.w700),
                    ),
                    onTap: () { Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginPage()
                    )); },
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget textField(tag, string,_controller) => Container(
    width: 279,
    height: 48,
    child: TextField(
      controller: _controller,
      obscureText: string,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
        ),
        labelText: tag,
        errorText: _controller.text == "" && triedLogin ? 'Veuillez completez ce champs' : null,
        labelStyle: TextStyle(color: Color(0xfffc718193), fontSize: 15),
        contentPadding: EdgeInsetsDirectional.only(start: 20),
      ),
    ),
  );

  Widget avatar(asset, double size) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Color(0xff157AD8).withOpacity(0.2),
          spreadRadius: 3,
          blurRadius: 5,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: CircleAvatar(
      radius: 27,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: size,
        child: Image.asset(
          asset,
          width: 100.0,
          height: 50.0,
          //  fit: BoxFit.cover,
        ),
        backgroundColor: Colors.white,
      ),
    ),
  );

  Widget _buildPopupDialog1(BuildContext context, String error) {
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
}
