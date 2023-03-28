import 'package:flutter/material.dart';
import 'package:payekawa/base/constant.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mon Panier'),
          backgroundColor: Color(0xFF947F6B), // set app bar color to a darker coffee color
        ),
      body: ListView.builder(
         padding: const EdgeInsets.all(16),
         itemCount: Constant.shoppingCart.length,
          itemBuilder: (BuildContext context, int index) {
      return Card(
        child: ListTile(
          leading: Image.asset(Constant.shoppingCart[index].imagePath),
          title: Text(Constant.shoppingCart[index].titleTxt),
          subtitle: Text(Constant.shoppingCart[index].subTxt),
        ),
      );
    })
    );
  }
}
