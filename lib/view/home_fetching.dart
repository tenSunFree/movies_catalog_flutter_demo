import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_catalog_flutter_demo/common/view_utils.dart';
import 'package:movies_catalog_flutter_demo/model/home_response.dart';
import 'package:movies_catalog_flutter_demo/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

class HomeFetching extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    return withScaffold(
        body: SafeArea(
            child: Center(
                child: StreamBuilder<List<HomeResponse>>(
                    stream: viewModel.getResponseStream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return addMargin(
                            left: 16,
                            right: 16,
                            child: Text(snapshot.error.toString(),
                                style: textStyleMedium(fontSize: 24)));
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return HomeScreen(list: snapshot.data);
                      } else {
                        return CircularProgressIndicator(
                            backgroundColor: Colors.white);
                      }
                    }))));
  }
}
