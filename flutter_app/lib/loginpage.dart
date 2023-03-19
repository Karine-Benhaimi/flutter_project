
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/Model/Product.dart';
import 'package:flutter_app/feed.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/base/constant.dart';


class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
          ),
          Container(
            height: 300,
            color: Colors.grey,
            child: Center(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: user,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Username',
                    ),
                  ),
                  TextField(
                    controller: pass,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () async {
                      await login();
                      Future.delayed(const Duration(seconds: 3));
                      print(Constant.products.length);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => FeedPage()));
                    },
                    child: Text('TextButton'),
                  )
                ],

              ),
            ),
          ),
        ],
      ),
    );
  }


  Future login() async {

    try {
      String url = "https://615f5fb4f7254d0017068109.mockapi.io/api/v1/products";
      http.Response res = await http.get(Uri.parse(url));

      if (res.statusCode == 200) {

        var data = json.decode(res.body);
        for(var da in data)
         {
           Product prod =  Product( da['name'].toString(), da['price'].toString(), da['description'].toString()  );
           Constant.products.add(prod);
         }



      }
    } catch (e) {
      debugPrint(e.toString());
    }


  }

}
