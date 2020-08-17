import 'package:flutter/material.dart';

class HomeCustomPageViewItemCard extends StatelessWidget {
  final String urlImage;
  final double radius;
  final bool hasShadow;

  const HomeCustomPageViewItemCard(
      {Key key, this.urlImage, this.radius = 0, this.hasShadow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            boxShadow: [
          BoxShadow(
              color: hasShadow ? Colors.white : Colors.transparent,
              blurRadius: 6,
              spreadRadius: 1)
        ],
            borderRadius: new BorderRadius.circular(radius),
            image: DecorationImage(
                image: NetworkImage(urlImage), fit: BoxFit.cover)));
  }
}
