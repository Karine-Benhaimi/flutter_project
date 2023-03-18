import 'package:flutter/material.dart';
import 'package:flutter_app/products/products_home_screen.dart';
import 'package:flutter_app/profil.dart';

class ClientHomePage extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page d\'acceuil pour client'),
        backgroundColor: Color(0xFF947F6B),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/coffee/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Spacer(),
              CardProduct('Produits'),
              CardProfil('Mon Profile'),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

class CardProfil extends StatelessWidget {
  final String str;
  CardProfil(this.str);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.brown[100],
        child: new InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage(
                  name: 'Karine',
                  imageUrl: 'https://366icons.com/media/01/profile-avatar-account-icon-16699.png',
                  bio: 'Coffee lover and enthusiast.',
                  number:'06 01 02 03 04',
                  mail: 'hi@mail.fr'
              )),
            );
          },
          child: SizedBox(
            width: 300,
            height: 100,
            child: Center(
              child: Text(
                str,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardProduct extends StatelessWidget {
  final String str;
  CardProduct(this.str);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.brown[100],
        child: new InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  ProductsHomeScreen()),
            );
          },
          child: SizedBox(
            width: 300,
            height: 100,
            child: Center(
              child: Text(
                str,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

