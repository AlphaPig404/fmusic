class ArtistRes{
  final int code;
  final Map<String, dynamic> data;
  final List<Artist> list;

  ArtistRes({this.code, this.data, this.list});

  factory ArtistRes.fromJson(Map<String, dynamic> json) {
    var list = json['data']['list'] as List;
    List<Artist> artistList = list.map((i) => Artist.fromJson(i)).toList();

    return new ArtistRes(
      code: json['code'],
      data: json['data'],
      list: artistList
    );
  }
}

class Artist{
  final String findex;
  final String id;
  final String fsingerMid;
  final String fsingerName;


  Artist({this.findex, this.id, this.fsingerMid, this.fsingerName});

  factory Artist.fromJson(Map<String, dynamic> parsedJson){
   return Artist(
     findex: parsedJson['Findex'],
     id: parsedJson['Fsinger_id'],
     fsingerMid: parsedJson['Fsinger_mid'],
     fsingerName: parsedJson['Fsinger_name']
   );
  }
}
