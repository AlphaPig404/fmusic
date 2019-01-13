import 'package:flutter/material.dart';
import 'package:f_music/model/getArtistList.dart';
import 'package:f_music/utils/http.dart';
import 'singer.dart';

class ArtistPage extends StatelessWidget{
  ArtistPage({Key key}):super(key: key);
  final List<String> indexList = List.from(['热','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']);
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Container(
        child: new Stack(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 30),
              child: new ArtistList(),
            ),
            new Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: new Container(
                height: 30,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                color: Color.fromRGBO(51, 51, 51, 1),
                child: new Text(
                  '热门',
                  style: new TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.5)
                  ),
                ),
              ),
            ),
            new Positioned(
              right: 0,
              top: 40,
              child: new Container(
                padding: const EdgeInsets.all(4),
                color: Color.fromRGBO(0, 0, 0, 0.3),
                child: new Column(
                  children: indexList.map((i){
                    return new Text(i,
                      style: new TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.5)
                      ),
                    );
                  }).toList()
                ),
              ) 
            ),
          ],
        ),
      );
    }
}

class ArtistList extends StatelessWidget{
  final List mockData = List.filled(100, 1);
  Future<ArtistRes> getArtistList() async{
    final http = new MyHttp('c.y.qq.com','/v8/fcg-bin/v8.fcg',{
      'g_tk': '1928093487',
      'uid': '0',
      'format': 'json',
      'inCharset': 'utf-8',
      'outCharset': 'utf-8',
      'notice': '0',
      'platform': 'yqq',
      'needNewCode': '0',
      '_': '1547199635353',
      'channel': 'singer',
      'page': 'list',
      'key': 'all_all_all',
      'pagesize': '100',
      'pagenum': '1',
      'hostUin': '0',

    });
    final json = await http.get();
    return ArtistRes.fromJson(json);
  }
  
  _buildArtistList(BuildContext context, List<Artist> data){
    return new ListView(
        children: data.map((artist){
          return new ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromRGBO(51, 51, 51, 1),
                backgroundImage: NetworkImage(
                  'https://y.gtimg.cn/music/photo_new/T001R300x300M000${artist.fsingerMid}.jpg?max_age=2592000'
                )
              ),
              title: new Text(
                artist.fsingerName,
                style: new TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  fontSize: 14
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Singer()));
              },
            );
        }).toList()
      );
  }
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return FutureBuilder<ArtistRes>(
         future: getArtistList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _buildArtistList(context, snapshot.data.list);
            }else if (snapshot.hasError) {
                return new Text("${snapshot.error}");
              }
              // By default, show a loading spinner
              return new Center(
                child: SizedBox(
                  height: 10.0,
                  width: 10.0,
                  child: new CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Color.fromRGBO(255, 205, 50, 1)),
                      ),
                  )
            );
          }
       );
    }
}

