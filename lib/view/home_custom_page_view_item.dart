import 'package:flutter/material.dart';
import 'package:movies_catalog_flutter_demo/common/view_utils.dart';
import 'package:movies_catalog_flutter_demo/model/home_response.dart';
import 'package:movies_catalog_flutter_demo/view/home_custom_page_view_item_card.dart';

class HomeCustomPageViewItem extends StatefulWidget {
  final HomeResponse response;

  const HomeCustomPageViewItem({Key key, this.response}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeCustomPageViewItemState();
}

class HomeCustomPageViewItemState extends State<HomeCustomPageViewItem>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 200),
        lowerBound: 0.0,
        upperBound: 0.1);
    _animationController.addListener(() {
      setState(() {});
    });
  }

  void _onTap() => toast(widget.response.title);

  @override
  Widget build(BuildContext context) {
    double scale = 1 - _animationController.value;
    return addSymetricMargin(
        horizontal: 5,
        child: Material(
            color: Colors.transparent,
            child: InkWell(
                onTap: _onTap,
                child: Transform.scale(
                    scale: scale,
                    child: HomeCustomPageViewItemCard(
                        urlImage: widget.response.url,
                        radius: 20,
                        hasShadow: true)))));
  }
}
