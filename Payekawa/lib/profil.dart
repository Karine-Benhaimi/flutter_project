import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:payekawa/base/constant.dart';
import 'package:payekawa/main.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // automaticallyImplyLeading: false,
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
              Icons.edit,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
        backgroundColor: Color(0xffffffff),
        title: Text(
          "Profile",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 22, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Image border
                      child: Image.asset("images/post4.jpg",
                          height: 245, fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 25, right: 25, top: 200),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      boxShadow: [],
                                      borderRadius: BorderRadius.circular(100)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        100), // Image border
                                    child: SizedBox.fromSize(
                                      size:
                                      Size.fromRadius(100), // Image radius
                                      child: Image.asset(
                                        'images/account3.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Cornelia Byrd",
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "San Francisco, CA",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.add_circle,
                            size: 49,
                            color: Colors.white70,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 120,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        spreadRadius: 5,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 13, top: 10),
                        child: Text(
                          "About",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Color(
                              0xff718193,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 13),
                      Padding(
                        padding: const EdgeInsets.only(left: 13),
                        child: Text(
                          "Hi! My name is Prameshwar Kumar, I’m a creative geek from San Francisco, CA. Contact me at creativejeff@gmail.com",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(
                              0xff718193,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),


            ],
          ),
        ),
      ),
    );
  }
}


class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  void logout()
  {
    Constant.shoppingCart.clear();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LoginPage()
    ));
  }

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator SettingPage - FRAME

    return Container(
        width: 375,
        height: 812,
        decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(
            children: <Widget>[


              Positioned(
                  top: 778,
                  left: 121,
                  child: Container(
                      width: 134,
                      height: 34,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 21,
                                left: 0,
                                child: Container(
                                    width: 134,
                                    height: 5,

                                    child: Stack(
                                        children: <Widget>[

                                        ]
                                    )
                                )
                            ),Positioned(
                                top: -8,
                                left: 0,
                                child: Container(
                                    width: 134,
                                    height: 34,
                                    decoration: BoxDecoration(
                                      color : Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 21,
                                              left: 0,
                                              child: Container(
                                                  width: 134,
                                                  height: 5,

                                                  child: Stack(
                                                      children: <Widget>[

                                                      ]
                                                  )
                                              )
                                          ),
                                        ]
                                    )
                                )
                            ),
                          ]
                      )
                  )
              ),

              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                      width: 375,
                      height: 44,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 13,
                                left: 32.486717224121094,
                                child: Container(
                                    width: 328.17462158203125,
                                    height: 18,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 4.833333969116211,
                                              left: 304.3465881347656,
                                              child: Container(
                                                  width: 23.828039169311523,
                                                  height: 10.333333969116211,

                                                  child: Stack(
                                                      children: <Widget>[

                                                      ]
                                                  )
                                              )
                                          )

                                        ]
                                    )
                                )
                            ),
                          ]
                      )
                  )
              ),

              Positioned(
                  top: 90,
                  left: 30,
                  child: Text('Profile', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(58, 58, 58, 1),
                      fontFamily: 'Roboto',
                      fontSize: 40,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),



              Positioned(
                  top: 488,
                  left: 24,
                  child: Container(
                      width: 315,
                      height: 49,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 315,
                                    height: 49,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 49,
                                              left: 0,
                                              child: Divider(
                                                  color: Color.fromRGBO(222, 225, 239, 1),
                                                  thickness: 1
                                              )

                                          ),

                                        ]
                                    )
                                )
                            ),
                          ]
                      )
                  )
              ),

              Positioned(
                  top: 415,
                  left: 24,
                  child: Container(
                      width: 315,
                      height: 49,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 315,
                                    height: 49,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 49,
                                              left: 0,
                                              child: Divider(
                                                  color: Color.fromRGBO(222, 225, 239, 1),
                                                  thickness: 1
                                              )

                                          ),Positioned(
                                              top: 0,
                                              left: 1,
                                              child: Text('Role', textAlign: TextAlign.left, style: TextStyle(
                                                  color: Color.fromRGBO(58, 58, 58, 1),
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 14,
                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          ),Positioned(
                                              top: 29,
                                              left: 0,
                                              child: Text('Client', textAlign: TextAlign.left, style: TextStyle(
                                                  color: Color.fromRGBO(96, 56, 8, 1),
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 14,
                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          )
                                        ]
                                    )
                                )
                            ),
                          ]
                      )
                  )
              ),Positioned(
                  top: 342,
                  left: 24,
                  child: Container(
                      width: 315,
                      height: 49,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 315,
                                    height: 49,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 49,
                                              left: 0,
                                              child: Divider(
                                                  color: Color.fromRGBO(222, 225, 239, 1),
                                                  thickness: 1
                                              )

                                          ),Positioned(
                                              top: 0,
                                              left: 1,
                                              child: Text('First Name', textAlign: TextAlign.left, style: TextStyle(
                                                  color: Color.fromRGBO(58, 58, 58, 1),
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 14,
                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          ),Positioned(
                                              top: 29,
                                              left: 0,
                                              child: Text(Constant.myUser.f_name, textAlign: TextAlign.left, style: TextStyle(
                                                  color: Color.fromRGBO(96, 56, 8, 1),
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 14,
                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          )
                                        ]
                                    )
                                )
                            ),
                          ]
                      )
                  )
              ),Positioned(
                  top: 269,
                  left: 24,
                  child: Container(
                      width: 315,
                      height: 49,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 315,
                                    height: 49,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 49,
                                              left: 0,
                                              child: Divider(
                                                  color: Color.fromRGBO(222, 225, 239, 1),
                                                  thickness: 1
                                              )

                                          ),Positioned(
                                              top: 0,
                                              left: 1,
                                              child: Text('Username', textAlign: TextAlign.left, style: TextStyle(
                                                  color: Color.fromRGBO(58, 58, 58, 1),
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 14,
                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          ),Positioned(
                                              top: 29,
                                              left: 0,
                                              child: Text(Constant.myUser.email, textAlign: TextAlign.left, style: TextStyle(
                                                  color: Color.fromRGBO(88, 49, 1, 1),
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 14,
                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          )
                                        ]
                                    )
                                )
                            ),
                          ]
                      )
                  )
              ),

              Positioned(
                  top: 530,
                  left: 115,
              child : ElevatedButton(
                onPressed: () {
                  logout();
                },
                child: const Text('Se Deconnecter'),
              ),
              ),

              Positioned(
                  top: 180,
                  left: 104,
                  child: Container(
                      width: 127,
                      height: 46,

                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Text(Constant.myUser.f_name, textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'SF Pro Text',
                                    fontSize: 20,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                            ),Positioned(
                                top: 27,
                                left: 0,
                                child: Text('Online', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'SF Pro Text',
                                    fontSize: 16,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                            ),
                          ]
                      )
                  )
              ),Positioned(
                  top: 44,
                  left: 25,
                  child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Stack(
                          children: <Widget>[

                          ]
                      )
                  )
              ),Positioned(
                  top: 180,
                  left: 36,
                  child: Container(
                      width: 53,
                      height: 53,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(196, 196, 196, 1),
                        image : DecorationImage(
                            image: AssetImage('assets/images/Ellipse15.png'),
                            fit: BoxFit.fitWidth
                        ),
                        borderRadius : BorderRadius.all(Radius.elliptical(53, 53)),
                      )
                  )
              ),
            ]
        )
    );
  }
}
