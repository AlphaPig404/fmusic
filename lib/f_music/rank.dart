import 'package:flutter/material.dart';
import 'package:f_music/utils/http.dart';
import 'package:f_music/model/getRankList.dart';

class RankPage extends StatelessWidget{
  Future<RankRes> getRankList() async{
    final http = new MyHttp('c.y.qq.com','/v8/fcg-bin/fcg_myqq_toplist.fcg',{
      'g_tk': '5381',
      'uid': '0',
      'format': 'json',
      'inCharset': 'utf-8',
      'outCharset': 'utf-8',
      'notice': '0',
      'platform': 'h5',
      'needNewCode': '1',
      '_': '1547199635353'
    });
    final json = await http.get();
    return RankRes.fromJson(json);
  }

  @override
    Widget build(BuildContext context) {
      return FutureBuilder<RankRes>(
         future: getRankList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new RankList(snapshot.data.list);
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

class RankList extends StatelessWidget{
  final List<Rank> listData;
  RankList(this.listData);
  @override
    Widget build(BuildContext context) {
      return new ListView(
        children: listData.map((rank){
          return new Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            color: Color.fromRGBO(51, 51, 51, 1),
            child: new Row(
              children: <Widget>[
                new Container(
                  width: 100,
                  height: 100,
                  child: new Image.network(
                    rank.picUrl
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: rank.songList.map((song){
                      final singleName= song.singername;
                      final songName = song.songname;
                      return new Text(
                          '$songName-$singleName',
                          style: new TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.3)
                        )
                      );
                    }).toList()
                  ),
                )
              ],
            ),
          );
        }).toList()
      );
    }
}