import 'package:flutter/material.dart';
import 'package:flutter_app/products/products_home_screen.dart';
import 'package:flutter_app/profil.dart';

class ClientHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8E1D9),
      appBar: AppBar(
        title: Text('Page d\'accueil pour client'),
        backgroundColor: Color(0xFF947F6B),
      ),
      body: Column(
        children: [
          Spacer(),
          CardProduct("Produits"),
          CardProfil("Mon Profil"),
          Spacer(),
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
                  imageUrl: 'https://nick-intl.mtvnimages.com/uri/mgid:file:gsp:kids-assets:/nick/properties/spongebob-squarepants/characters/gary-character-web-desktop.png?height=0&width=480&matte=true&crop=false',
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

