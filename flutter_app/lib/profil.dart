import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String bio;
  final String number;
  final String mail;

  ProfilePage({required this.name, required this.imageUrl, required this.bio, required this.number, required this.mail});

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
                  backgroundImage: NetworkImage(imageUrl),
                  backgroundColor: Color(0xFFF8E1D9),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              name,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3E3D3A), // set name text color to a dark brown color
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              bio,
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0xFF4D4D4D), // set bio text color to a light brown color
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Numéro de téléphone',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3E3D3A), // set title text color to a dark brown color
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              number,
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0xFF4D4D4D), // set bio text color to a light brown color
              ),
            ),

            SizedBox(height: 16.0),
            Text(
              'E mail',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3E3D3A), // set title text color to a dark brown color
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              mail,
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0xFF4D4D4D), // set bio text color to a light brown color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
