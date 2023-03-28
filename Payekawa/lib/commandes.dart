import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:payekawa/base/constant.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class Order {
  final String clientName;
  final String orderNumber;
  final String orderStatus;



  Order(this.clientName, this.orderNumber, this.orderStatus);

  factory Order.fromJson(Map<String, dynamic> json ) {
    return Order(
      json['email'],
      json['num'],
      json['orderStatus']

    );
  }
}

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<Order> _orders = [];

  Future<void> _loadOrders() async {
    String jsonString = await DefaultAssetBundle.of(context).loadString('assets/orders.json');
    List<dynamic> jsonList = json.decode(jsonString);
    setState(() {
      _orders = jsonList.map((json) => Order.fromJson(json)).toList();
    });
  }

  Future<void> loadOrder() async {
    var url = Uri.http(Constant.ipaddress + ":2101", '/mailing_auth/all_com.php', {'q': '{http}'});
    print(url.toString());
    var response = await http.post(url);

    print("user : " + response.toString());

    List<dynamic> jsonList = json.decode(response.body);
    setState(() {
      _orders = jsonList.map((json) => Order.fromJson(json)).toList();
    });

    print(_orders.length);

  }



  @override
  void initState() {
    super.initState();
   // _loadOrders();
    loadOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Commandes"),
        backgroundColor: Color(0xFF947F6B),
      ),
      body: Container(

        decoration: BoxDecoration(
          color: Color(0xFFF8E1D9),
        ),
        child: ListView.builder(
          itemCount: _orders.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailCommande(
                      orderNumber: _orders[index].orderNumber,
                        clientName :_orders[index].clientName,
                        orderStatus :_orders[index].orderStatus,
                    ),
                  ),
                );
              },
              child: Card(
                color: Colors.brown[100],
                child: ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text(_orders[index].clientName),
                  subtitle: Text("Order #" + _orders[index].orderNumber),
                  trailing: Text(_orders[index].orderStatus),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailCommande extends StatefulWidget {
  const DetailCommande({Key? key, required this.orderNumber, required this.clientName,required this.orderStatus}) : super(key: key);

  final String orderNumber;
  final String clientName;
  final String orderStatus;
  @override
  State<DetailCommande> createState() => _DetailCommandeState();
}

class _DetailCommandeState extends State<DetailCommande> {


  Future<void> LoadcomProducts() async {

    var url = Uri.http(Constant.ipaddress + ":2101", '/mailing_auth/getCommand.php', {'q': '{http}'});


    var response = await http.post(url, body: {
      "num": widget.orderNumber
    });


    var data = json.decode(response.body);
    print(data.toString());
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF8E1D9),
        appBar: AppBar(
          title: Text("Order Detail"),
          backgroundColor: Color(0xFF947F6B),
        ),
        body: Column(
          children: [
        Container(
        padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nom du client :",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            widget.clientName,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Text(
            "Numéro de commande :",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            widget.orderNumber,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Text(
            "Status de commande :",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            widget.orderStatus,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
        ],
      ),
    ),
    Text(
    "List des produits :",
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 20)
            ,
            FutureBuilder(
                future: LoadcomProducts(),

                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Container(
                      height: 350,
                       child: ListView.builder(
                        itemCount: snapshot.data.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            color: Colors.brown[100],
                            child: ListTile(
                              leading: Icon(Icons.shopping_cart),
                              title: Text(snapshot.data[index]["nom"] ),
                              subtitle: Text(snapshot.data[index]["description"]),
                              trailing: Text(""),
                            ),
                          );
                        }
                    )
                    );

                  }
                }),
          ],
        )
    );
  }
}




class DetailOrderPage extends StatelessWidget {
  final String clientName;
  final String orderNumber;
  final String orderStatus;


  DetailOrderPage({
    required this.clientName,
    required this.orderNumber,
    required this.orderStatus,
  });



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8E1D9),
      appBar: AppBar(
        title: Text("Order Detail"),
        backgroundColor: Color(0xFF947F6B),
      ),
      body: FutureBuilder(

        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nom du client :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    clientName,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Numéro de commande :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    orderNumber,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Status de commande :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    orderStatus,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            );
          }
        })
    );
  }
}