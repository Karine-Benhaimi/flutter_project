import 'package:flutter/material.dart';
import 'package:payekawa/client_home_page.dart';
import 'package:payekawa/main.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/bg1.png',
              width: double.maxFinite,
              fit: BoxFit.fill,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/check.png',
                  ),
                ),
                Container(
                  width: 250,
                  child: Column(children: [
                    Text(
                      'Bienvenue',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Votre compte à été ouvert avec success',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color(0xff718193),
                      ),
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      child: Container(
                        height: 50,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(29),
                          color: Color(0xff41D0B6),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff41D0B6).withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Connecter',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onTap: () => { Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>  LoginPage(),
                      )) },
                    ),
                  ]),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
