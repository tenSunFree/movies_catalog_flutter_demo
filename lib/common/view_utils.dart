import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:transparent_image/transparent_image.dart';

Widget withScaffold({Widget body, String title}) =>
    Scaffold(backgroundColor: Colors.blueGrey, body: body);

Widget addSymetricMargin(
        {Widget child, double horizontal = 0.0, double vertical = 0.0}) =>
    Container(
        margin:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: child);

Widget addMargin(
        {Widget child,
        double top = 0.0,
        double bottom = 0.0,
        double left = 0.0,
        double right = 0.0}) =>
    Container(
        margin:
            EdgeInsets.only(top: top, bottom: bottom, left: left, right: right),
        child: child);

double distortionBasedOnPage(double page, int index) {
  const SCALE_FRACTION = 0.3;
  const FULL_SCALE = 1.0;

  final diffPosition = page - index;
  double normalizedDistortion =
      (FULL_SCALE - (diffPosition.abs() * SCALE_FRACTION)).clamp(0.0, 1.0);
  return normalizedDistortion;
}

class RemoveDefaultScrollGlowBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

textStyleMedium({double fontSize, Color color = Colors.white}) =>
    _textStyle(fontSize: fontSize, fontWeight: FontWeight.w700, color: color);

_textStyle({double fontSize, fontWeight: FontWeight, Color color}) => TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    fontFamily: 'Montserrat');

Widget fadeNetworkImage({url: String, width: double, height: double}) =>
    FadeInImage.memoryNetwork(
        key: ValueKey(url),
        width: width,
        height: height,
        fit: BoxFit.cover,
        image: url,
        placeholder: kTransparentImage);

void toast(String msg) => Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.black,
    fontSize: 16.0);
