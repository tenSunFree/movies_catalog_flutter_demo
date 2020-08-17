import 'package:flutter/material.dart';
import 'package:movies_catalog_flutter_demo/view/home_fetching.dart';
import 'package:movies_catalog_flutter_demo/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: 'Montserrat',
            primaryColor: Colors.white,
            accentColor: Colors.black,
            splashColor: Colors.white12.withOpacity(0.1)),
        home: Provider<HomeViewModel>(
            builder: (context) => HomeViewModel(), child: HomeFetching()));
  }
}
