import 'package:movies_catalog_flutter_demo/model/home_repository.dart';
import 'package:movies_catalog_flutter_demo/model/home_response.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel {
  final RemoteRepository _service = RemoteRepositoryImpl();

  Observable<List<HomeResponse>> get getResponseStream => _getResponseStream();

  Stream<List<HomeResponse>> _getResponseStream() =>
      Observable.fromFuture(_service.getResponseFuture());
}
