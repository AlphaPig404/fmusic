class Disc{
  final int code;
  final String message;
  final Map<String, dynamic> data;
  final List<Album> list;

  Disc({this.code, this.message, this.data, this.list});

  factory Disc.fromJson(Map<String, dynamic> json) {
    var list = json['data']['list'] as List;
    List<Album> albumList = list.map((i) => Album.fromJson(i)).toList();

    return new Disc(
      code: json['code'],
      message: json['message'],
      data: json['data'],
      list: albumList
    );
  }
}

class Album{
  final String dissname;
  final String imgurl;
  final Creator creator;

  Album({this.dissname, this.imgurl, this.creator});

  factory Album.fromJson(Map<String, dynamic> parsedJson){
   return Album(
     dissname: parsedJson['dissname'],
     imgurl: parsedJson['imgurl'],
     creator: Creator.fromJson(parsedJson['creator'])
   );
  }
}

class Creator{
  final String name;

  Creator({this.name});

  factory Creator.fromJson(Map<String, dynamic> parsedJson){
    return Creator(
      name: parsedJson['name']
    );
  }
}