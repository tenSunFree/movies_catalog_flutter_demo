class HomeResponse {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  HomeResponse(
      {this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  HomeResponse.fromJson(dynamic json) {
    albumId = json["albumId"];
    id = json["id"];
    title = json["title"];
    url = json["url"];
    thumbnailUrl = json["thumbnailUrl"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["albumId"] = albumId;
    map["id"] = id;
    map["title"] = title;
    map["url"] = url;
    map["thumbnailUrl"] = thumbnailUrl;
    return map;
  }

  static List<HomeResponse> fromJsonToList(List<dynamic> jsonList) =>
      List<HomeResponse>.from(
          jsonList.map((json) => HomeResponse.fromJson(json)));
}
