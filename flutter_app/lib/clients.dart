import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter_app/base/constant.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;


class Client {
  final String name;
  final String email;
  final String phone;

  Client(this.name, this.email, this.phone);

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      json['name'],
      json['email'],
      json['phone'],
    );
  }
}

class ClientPage extends StatefulWidget {
  @override
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  List<Client> _clients = [];

  Future loadClients() async
  {
    var url = Uri.http(Constant.ipaddress + ":2101", '/mailing_auth/getClients.php', {'q': '{http}'});
    print(url.toString());

    var response = await http.get(url);

    var data = json.decode(response.body);
    List<dynamic> jsonList = data;
    setState(() {
      _clients = jsonList.map((json) => Client.fromJson(json)).toList();
    });


  }



  @override
  void initState() {
    super.initState();
    //_loadClients();
    loadClients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBF3DD3),
      appBar: AppBar(
        title: Text("Clients"),
        backgroundColor: Color(0xFF947F6B),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF8E1D9),
        ),
        child: ListView.builder(
          itemCount: _clients.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailClientPage(
                      name: _clients[index].name,
                      email: _clients[index].email,
                      phone: _clients[index].phone,
                    ),
                  ),
                );
              },
              child: Card(
                color: Colors.brown[100],
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text(_clients[index].name),
                  subtitle: Text(_clients[index].email),
                  trailing: Text(_clients[index].phone),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailClientPage extends StatelessWidget {
  final String name;
  final String email;
  final String phone;

  DetailClientPage({
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8E1D9), // set background color to a light coffee color
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFF947F6B), // set app bar color to a darker coffee color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Center (
              child: Container(
                width: 200,
                height: 200,
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundImage: NetworkImage('https://366icons.com/media/01/profile-avatar-account-icon-16699.png'),
                  backgroundColor: Color(0xFFF8E1D9),
                ),
              ),
            ),
            Text(
              "Nom du client",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              name,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              "Mail du client:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              email,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              "Numéro de téléphone ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              phone,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

