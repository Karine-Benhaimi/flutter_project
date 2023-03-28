import 'package:flutter/material.dart';
import 'package:payekawa/base/constant.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Text("Product"),
          Expanded(
            child: Container(
              height: 50,
              width: 400,

              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, i) {

                  return Container(
                    height: 100,
                    width: 140,
                    child: Card(
                      child: ListTile(
                        title: Text(Constant.products[i].name),
                        subtitle: Text(Constant.products[i].Description),
                        trailing: Icon(Icons.more_vert),
                      ),
                    ),
                  );


                },

    ),
            ),
          ),
        ],
      );
  }
}
