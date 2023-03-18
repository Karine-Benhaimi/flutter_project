import 'package:flutter/material.dart';
import 'package:flutter_app/client_home_page.dart';
import 'package:flutter_app/admin_home_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Créer un compte')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_username == 'admin' && _password == 'admin') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminHomePage(),
                        ),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClientHomePage(),
                        ),
                      );
                    }
                  }
                },
                child: Text('Créer un compte'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}