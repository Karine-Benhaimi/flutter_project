import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Model/Product.dart';
import '../Model/products_list_data.dart';
import '../Model/user.dart';




class Constant {

  static User myUser = new User("","","0");
  static String codeSession = "";
  static String emailSession = "";
  static const String fontsFamily = "Montserrat";
  static const String fromLogin = "getFromLoginClick";
  static const String homePos = "getTabPos";
  static const String nameSend = "name";
  static const String imageSend = "image";
  static const int stepStatusNone = 0;
  static const int stepStatusActive = 1;
  static const int stepStatusDone = 2;
  static const int stepStatusWrong = 3;
  static const String ipaddress =   "192.168.0.25";  //"192.168.56.1"; "172.18.39.241";

  static List<ProductsListData> shoppingCart = List<ProductsListData>.empty(growable: true);
  static List<Product> products   = List<Product>.empty(growable: true);



  static double getPercentSize(double total, double percent) {
    return (percent * total) / 100;
  }

  static backToPrev(BuildContext context) {
    Navigator.of(context).pop();
  }

  static double getHeightSize(double i,BuildContext context)
  {
    return MediaQuery.of(context).size.height * i;
  }

  static double getWidthSize(double i,BuildContext context)
  {
    return MediaQuery.of(context).size.width * i;
  }

  static getCurrency(BuildContext context) {
    return "ETH";
  }

  static NavigateTo(BuildContext context, String route, {Object? arguments}) {
    if (arguments != null) {
      Navigator.pushNamed(context, route, arguments: arguments);
    } else {
      Navigator.pushNamed(context, route);
    }
  }

  static sendToNextWithBackResult(
      BuildContext context, String route, ValueChanged<dynamic> fun,
      {Object? arguments}) {
    if (arguments != null) {
      Navigator.pushNamed(context, route, arguments: arguments).then((value) {
        fun(value);
      });
    } else {
      Navigator.pushNamed(context, route).then(
            (value) {
          fun(value);
        },
      );
    }
  }



  static double getToolbarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top + kToolbarHeight;
  }

  static double getToolbarTopHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static sendToScreen(Widget widget, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => widget,
    ));
  }

  static backToFinish(BuildContext context) {
    Navigator.of(context).pop();
  }

  static closeApp() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    });
  }
}
