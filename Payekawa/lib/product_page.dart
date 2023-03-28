import 'package:flutter/material.dart';
import 'package:payekawa/Model/products_list_data.dart';
import 'package:payekawa/base/constant.dart';
import 'package:payekawa/client_home_page.dart';

class ProductPage extends StatefulWidget {
  final ProductsListData data;
  const ProductPage({Key? key,required this.data}) : super(key: key);


  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              //forceElevated: innerBoxIsScrolled,
              //floating: true,
              automaticallyImplyLeading: false,
              backgroundColor: Color(0xffffffff),
              leading: IconButton(
                onPressed: () {

                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 28,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ],

              title: Text(
                "Shopping",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Colors.black),
              ),
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Image.asset(
                  widget.data.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'coffee',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: Color(0xff718193)),
                ),
                Text(
                  widget.data.titleTxt,
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.data.price.toString()+"€",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 24),
                        ),
                        SizedBox(width: 15),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),


                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 25),
                  child: Container(
                    height: 40,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff31AFF8).withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 20,
                          offset: Offset(0, 3),
                        )
                      ],
                      color: Color(0xff157AD8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Constant.shoppingCart.add(widget!.data);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ClientHomePage()),
                        );
                      },
                      style: ButtonStyle(
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'Ajouter',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff718193),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Container(
                    child: Text(
                        widget.data.subTxt,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),

    );
  }

  Widget topBar() => Padding(
    padding: const EdgeInsets.only(left: 5, right: 10, top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              IconButton(
                onPressed: () {

                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              SizedBox(width: 15),
              Text(
                "Shopping",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.bookmark,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );



  Widget item(name) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          name,
          height: 100,
          width: 130,
          fit: BoxFit.fill,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Toggle Lace",
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 15),
              ),
              Text(
                "\$75.36",
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
