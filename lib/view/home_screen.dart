import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movies_catalog_flutter_demo/common/view_utils.dart';
import 'package:movies_catalog_flutter_demo/model/home_change_notifiers.dart';
import 'package:movies_catalog_flutter_demo/model/home_response.dart';
import 'package:provider/provider.dart';
import 'home_custom_page_view.dart';

class HomeScreen extends StatefulWidget {
  final List<HomeResponse> list;

  const HomeScreen({this.list});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> curvedAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        lowerBound: 0.7,
        duration: const Duration(milliseconds: 700),
        vsync: this);
    curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.ease);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              builder: (context) => HomeResponseNotifier(widget.list[0])),
          ChangeNotifierProvider(builder: (context) => PageNotifier()),
          ChangeNotifierProvider(builder: (context) => IndexNotifier())
        ],
        child: ScaleTransition(
            scale: curvedAnimation,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/icon_top_bar.png'),
                  Expanded(
                      child: Stack(children: <Widget>[
                    backgroundHero(width: width, height: height),
                    HomeCustomPageView(list: widget.list)
                  ])),
                  Image.asset('assets/icon_bottom_bar.png')
                ])));
  }

  backgroundHero({width: double, height: double}) {
    return Consumer<HomeResponseNotifier>(
        builder: (context, notifier, _) => Hero(
            tag: notifier.response.id,
            child: Stack(children: <Widget>[
              fadeNetworkImage(
                  width: width, height: height, url: notifier.response.url),
              BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                  child: Container(
                      height: height,
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.5))))
            ])));
  }
}
