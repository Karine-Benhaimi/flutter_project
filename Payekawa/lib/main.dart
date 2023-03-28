import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payekawa/products/products_home_screen.dart';
import 'package:payekawa/clients.dart';
import 'package:payekawa/commandes.dart';
import 'package:payekawa/profil.dart';
import 'package:payekawa/admin_home_page.dart';
import 'package:payekawa/client_home_page.dart';
import 'package:payekawa/register_page.dart';
import 'package:payekawa/base/constant.dart';
import 'package:payekawa/modif.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  var getResult = 'QR Code Result';



  Future<void> login() async {
    var url = Uri.http(Constant.ipaddress + ":2101", '/mailing_auth/connexion.php', {'q': '{http}'});
    print(url.toString());

    var response = await http.post(url, body: {
      "email": _usernameController.text.toString(),
      "mdp": _passwordController.text.toString(),
    });

    Constant.emailSession = _usernameController.text;

    var data = jsonDecode(response.body);

    if(data.toString() == "Success")
      {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ClientHomePage()),
        );
      }

  }


  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'admin' && password == 'admin') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminHomePage()),
      );
    } else {
      login();
    }
  }

  void _goToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [

                    Container(
                      width: 600,
                      height: 400,
                      child: Expanded(
                        child: Image.asset(
                          'assets/Rectangle10.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top :350,
                      left :290,
                      child: GestureDetector(
                        child: Icon( Icons.qr_code_2,size: 45,),
                          onTap: () { Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => QRViewExample()
                          )); }
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 70),
                      child: Container(
                        width: 140,
                        height: 135,
                        child: Expanded(
                          child: Image.asset(
                            'assets/coffee/logo.png',
                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 23, top: 225),
                      child: Text(
                        'CONNEXION',
                        style : TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 23, top: 262),
                      child: Text(
                        'Connectez-vous et naviguez \nsur notre collection de coffez \nfaite pour vous',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [

                    textField('email',  Icons.mail,_usernameController),
                    SizedBox(
                      height: 15,
                    ),
                    textField('mot de passe', Icons.lock,_passwordController),
                    Padding(
                      padding: const EdgeInsets.only(right: 15, top: 15),
                      child: GestureDetector(
                        child: Container(
                          width: double.maxFinite,
                          child: Text(
                            'oublier votre mot de passe?',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xffA1670B),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                          onTap: () => { Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ModifPage(),
                          )) }
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: GestureDetector(
                        child: Container(
                          height: 50,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(29),
                            color: Color(0xffA1670B),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffA1670B).withOpacity(0.3),
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
                        onTap: () => { _login()
                         },
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Pas de compte?',
                            style: TextStyle(
                                color: Color(0xff718193),
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            child: Text(
                              'Inscrivez-vous',
                              style: TextStyle(
                                color: Color(0xffA1670B),
                                fontWeight: FontWeight.w700,
                                // fontSize: 15),
                              ),
                            ),
                              onTap: () => { Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              )) }
                          ),
                        ],
                      ),
                    )
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textField(String name, lable,controller) => Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff718193)),
        ),
        prefixIcon: Icon(lable, color: Color(0xff157AD8)),
        hintText: name,
        hintStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Color(0xff242B35),
        ),
      ),
    ),
  );
}
class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  Timer? timer;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => checkQRCode());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text('Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  else
                    const Text('Scan a code'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return Text('Flash: ${snapshot.data}');
                              },
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.flipCamera();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return Text(
                                      'Camera facing ${describeEnum(snapshot.data!)}');
                                } else {
                                  return const Text('loading');
                                }
                              },
                            )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.pauseCamera();
                          },
                          child: const Text('pause',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.resumeCamera();
                          },
                          child: const Text('resume',
                              style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void checkQRCode()
  {
    print("bibi");
    if(result != null) {
      print("hey bo");
      print(result!.code);
      List<Map<String, dynamic>> map = [];
      map = List<Map<String, dynamic>>.from(jsonDecode(result!.code.toString()));
      //Map<String, dynamic> date = jsonDecode(  result!.code.toString() );
      print("pass :" + map[0]['email '] );
      login(map[0]['email '], map[0]['mdp']);
      timer!.cancel();
    }

  }

  Future<void> login(String user,String pass) async {
    var url = Uri.http(Constant.ipaddress + ":2101", '/mailing_auth/connexion.php', {'q': '{http}'});
    print(url.toString());

    var response = await http.post(url, body: {
      "email": user,
      "mdp": pass,
    });

    Constant.emailSession = user;
    var data = jsonDecode(response.body);

    if(data.toString() == "Success")
    {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ClientHomePage()),
      );
    }

  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    print('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}