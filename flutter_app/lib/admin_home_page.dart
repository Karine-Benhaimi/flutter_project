import 'package:flutter/material.dart';
import 'package:flutter_app/clients.dart';
import 'package:flutter_app/commandes.dart';
import 'package:flutter_app/products/products_home_screen.dart';


class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFFF8E1D9),
      appBar: AppBar(
        title: Text('Page d\'acceuil pour admin'),
          backgroundColor: Color(0xFF947F6B),
      ),
      body: Column(
        children: [
          Spacer(),
          CardClient('Clients'),
          CardCommand('Commandes'),
          CardProduct('Produits'),
          Spacer(),
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