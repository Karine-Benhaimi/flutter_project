import 'package:flutter/material.dart';
import 'package:payekawa/clients.dart';
import 'package:payekawa/commandes.dart';
import 'package:payekawa/products/products_home_screen.dart';


class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page d\'acceuil pour admin'),
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
              CardClient('Clients'),
              CardCommand('Commandes'),
              CardProduct('Produits'),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}




class CardClient extends StatelessWidget {
  final String str;
  CardClient(this.str);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          color: Colors.brown[100],
          child: new InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  ClientPage()),
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
          )
      ),
    );
  }
}


class CardProduct extends StatelessWidget {
  final String str;
  CardProduct(this.str);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown[100],
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductsHomeScreen()),
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
    );
  }
}

class CardCommand extends StatelessWidget {
  final String str;
  CardCommand(this.str);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown[100],
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OrderPage()),
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
    );
  }
}