import 'dart:convert';
import 'package:flutter/material.dart';

class Order {
  final String clientName;
  final String orderNumber;
  final String orderStatus;

  Order(this.clientName, this.orderNumber, this.orderStatus);

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      json['clientName'],
      json['orderNumber'],
      json['orderStatus'],
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

  @override
  void initState() {
    super.initState();
    _loadOrders();
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
                    builder: (context) => DetailOrderPage(
                      clientName: _orders[index].clientName,
                      orderNumber: _orders[index].orderNumber,
                      orderStatus: _orders[index].orderStatus,
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
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Client Name:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              clientName,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              "Order Number:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              orderNumber,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              "Order Status:",
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
      ),
    );
  }
}