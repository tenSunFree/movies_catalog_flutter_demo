import 'dart:convert';
import 'home_response.dart';
import 'package:http/http.dart' as http;

mixin RemoteRepository {
  Future<List<HomeResponse>> getResponseFuture();
}

class RemoteRepositoryImpl implements RemoteRepository {
  String _baseUrl = "jsonplaceholder.typicode.com";

  _httpGet(String path) async => await http.get(Uri.https(_baseUrl, path));

  @override
  Future<List<HomeResponse>> getResponseFuture() async {
    final response = await _httpGet("/photos");
    final jsonList = json.decode(response.body);
    return HomeResponse.fromJsonToList(jsonList);
  }
}
