class SingerResData{
  final List<Song> songList;
  final String singerId;
  final String singerMid;
  final String singerName;
  final int total;
  
  SingerResData({this.songList, this.singerId, this.singerMid, this.singerName, this.total});

  factory SingerResData.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
    List<Song> songList = list.map((i) => Song.fromJson(i)).toList();

    return SingerResData(
      songList: songList,
      singerId: json['singer_id'],
      singerMid: json['singer_mid'],
      singerName: json['singer_name'],
      total: json['total']
    );
  }
}

class Song{
  final MusicData musicData;
  Song({this.musicData});

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      musicData: MusicData.fromJson(json['musicData']),
    );
  }
}

class MusicData{
  final int albummid;
  final String albumname;
  final String songname;
  MusicData({this.albummid, this.albumname, this.songname});

  factory MusicData.fromJson(Map<String, dynamic> json) {
    return MusicData(
      albummid: json['albumid'],
      albumname: json['albumname'],
      songname: json['songname']
    );
  }
}
