import 'package:flutter/cupertino.dart';
import 'package:movies_catalog_flutter_demo/common/custom_page_view.dart';
import 'package:movies_catalog_flutter_demo/common/view_utils.dart';
import 'package:movies_catalog_flutter_demo/model/home_change_notifiers.dart';
import 'package:movies_catalog_flutter_demo/model/home_response.dart';
import 'package:provider/provider.dart';
import 'home_custom_page_view_item.dart';

class HomeCustomPageView extends StatelessWidget {
  final List<HomeResponse> list;

  const HomeCustomPageView({Key key, @required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (list.length == 0)
      return Text('沒有資料', style: textStyleMedium(fontSize: 24));
    else {
      return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return addMargin(
            child: CustomPageView(
                height: constraints.maxHeight,
                onPageChanged: (newIndex) =>
                    Provider.of<HomeResponseNotifier>(context).response =
                        list[newIndex],
                onPageScrolled: (newPage) =>
                    Provider.of<PageNotifier>(context).page = newPage,
                children: list.map((item) {
                  return addSymetricMargin(
                      horizontal: 10,
                      vertical: 20,
                      child: Hero(
                          tag: item.thumbnailUrl,
                          child: HomeCustomPageViewItem(
                              key: ValueKey(item.id), response: item)));
                }).toList()));
      });
    }
  }
}
