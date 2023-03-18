import 'package:flutter/material.dart';
import 'package:flutter_app/admin_home_page.dart';
import 'package:flutter_app/client_home_page.dart';
import 'package:flutter_app/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'admin' && password == 'admin') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminHomePage()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ClientHomePage()),
      );
    }
  }

  void _goToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          hintStyle: TextStyle(color: HexColor('#3E3D3A')),
                        ),
                        style: TextStyle(color: HexColor('#3E3D3A')),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Mot de passe',
                          hintStyle: TextStyle(color: HexColor('#3E3D3A')),
                        ),
                        style: TextStyle(color: HexColor('#3E3D3A')),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          primary: HexColor('#947f6b'),
                        ),
                        child: Text('Se connecter', style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: _goToRegisterPage,
                        child: Text('Créer un compte', style: TextStyle(color: HexColor('#3E3D3A'))),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          //TODO: Add password reset functionality
                        },
                        child: Text('Modifier le mot de passe', style: TextStyle(color: HexColor('#3E3D3A'))),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
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
