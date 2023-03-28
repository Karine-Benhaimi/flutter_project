

import 'package:flutter/material.dart';
import 'package:payekawa/admin_home_page.dart';
import 'package:payekawa/base/constant.dart';
import 'package:payekawa/products/products_home_screen.dart';
import 'package:payekawa/profil.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:payekawa/shopping_cart.dart';

import 'Model/user.dart';


class ClientHomePage extends StatefulWidget {
  const ClientHomePage({Key? key}) : super(key: key);

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  int currentPageIndex = 0;

  Future<void> loadUserInfo() async {
    var url = Uri.http(Constant.ipaddress + ":2101", '/mailing_auth/getUserInfo.php', {'q': '{http}'});
    print(url);

    var response = await http.post(url, body: {
      "email": Constant.emailSession,
    });

    var data = await json.decode(response.body);

    print(data.toString());
    Constant.myUser = User( data[0]["email"], data[0]["fullname"], data[0]["isAdmin"]);

    if(Constant.myUser.isAdmin == "1" )
      {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AdminHomePage()
        ));
      }
  }

  @override
  void initState() {
    super.initState();
    loadUserInfo();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(

        bottomNavigationBar: NavigationBar(
          animationDuration: const Duration(milliseconds: 1000),
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Products',
            ),
            NavigationDestination(
              icon: Icon(Icons.explore),
              label: 'Profil',
            ),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          //backgroundColor: Colors.blue,
          //elevation: 10,
          //surfaceTintColor: Colors.lime,
          //height: 20,
          //labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        ),
        body: <Widget>[
          ProductsHomeScreen(),
          SettingPage(),
          Container(
            color: Colors.pink,
            alignment: Alignment.center,
            child: const Text('Pink'),
          ),

        ][currentPageIndex],


        floatingActionButton: FloatingActionButton(
          onPressed: ()
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShoppingCart()),
            );
          },
          child: Icon(Icons.home_filled, size: 30),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

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

