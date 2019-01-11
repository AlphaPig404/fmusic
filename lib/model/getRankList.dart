class RankRes{
  final int code;
  final String message;
  final Map<String, dynamic> data;
  final List<Rank> list;

  RankRes({this.code, this.message, this.data, this.list});

  factory RankRes.fromJson(Map<String, dynamic> json) {
    var list = json['data']['topList'] as List;
    List<Rank> rankList = list.map((i) => Rank.fromJson(i)).toList();

    return new RankRes(
      code: json['code'],
      message: json['message'],
      data: json['data'],
      list: rankList
    );
  }
}

class Rank{
  final String picUrl;
  final int id;
  final List<Song> songList;

  Rank({this.picUrl, this.id, this.songList});

  factory Rank.fromJson(Map<String, dynamic> parsedJson){
  var list =  parsedJson['songList'] as List;
  List<Song> songList = list.map((i) => Song.fromJson(i)).toList();
   return Rank(
     picUrl: parsedJson['picUrl'],
     id: parsedJson['id'],
     songList: songList
   );
  }
}

class Song{
  final String singername;
  final String songname;

  Song({this.singername, this.songname});

  factory Song.fromJson(Map<String, dynamic> parsedJson){
    return Song(
      singername: parsedJson['singername'],
      songname: parsedJson['songname']
    );
  }
}