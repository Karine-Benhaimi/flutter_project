import 'dart:convert';
import 'package:flutter/material.dart';

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

  Future<void> _loadClients() async {
    String jsonString =
    await DefaultAssetBundle.of(context).loadString('assets/clients.json');
    List<dynamic> jsonList = json.decode(jsonString);
    setState(() {
      _clients = jsonList.map((json) => Client.fromJson(json)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadClients();
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
                  backgroundImage: NetworkImage('https://nick-intl.mtvnimages.com/uri/mgid:file:gsp:kids-assets:/nick/properties/spongebob-squarepants/characters/gary-character-web-desktop.png?height=0&width=480&matte=true&crop=false'),
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
