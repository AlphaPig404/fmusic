import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:f_music/utils/http.dart';
import 'package:f_music/model/getDiscList.dart';

class RecommentPage extends StatelessWidget{
  const RecommentPage({Key key}): super(key: key);
  @override
    Widget build(BuildContext context) {
      return new Container(
        child: new ListView(
          children: <Widget>[
            new Container(
              height: 165,
              child: new Swiper(
                itemBuilder: (BuildContext context,int index){
                  return new Image.network("http://y.gtimg.cn/music/common/upload/MUSIC_FOCUS/1121987.jpg",fit: BoxFit.fill,);
                },
                itemCount: 3,
                pagination: new SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeColor: Colors.white,
                      color: Colors.black,
                    )
                )
              ),
            ),
            new Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              alignment: Alignment.center,
              child: new Text(
                '热门歌单推荐',
                style: TextStyle(
                  color: Color.fromRGBO(255, 205, 50, 1),
                  fontSize: 16
                )
              )
            ),
            new MusicList()
          ],
        ),
      );
    }
}

class MusicList extends StatelessWidget{

  Future<Disc> fetchDiscList() async{
    final http = new MyHttp('ustbhuangyi.com','/music/api/getDiscList',{
      'inCharset': 'utf-8',
      'outCharset': 'utf-8',
      'notice': '0',
      'format': 'json',
      'platform': 'yqq',
      'hostUin': '0',
      'sin': '0',
      'ein': '29',
      'sortId': '5',
      'needNewCode': '0',
      'categoryId': '10000000',
      'rnd': '0.2717324474904248',
      'g_tk': '1928093487',
    });
    final json = await http.get();
    return Disc.fromJson(json);
  }

  @override
    Widget build(BuildContext context) {
      return new FutureBuilder<Disc>(
            future: fetchDiscList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Album> list = snapshot.data.list;
                return new Column(
                  children: list.map((album){
                    return new Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            width: 50,
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: new Image.network(
                              album.imgurl
                            ),
                          ),
                          new Expanded(
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Container(
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.only(bottom: 4),
                                  child: new Text(
                                    album.creator.name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16
                                    ),
                                  ),
                                ),
                                new Container(
                                  alignment: Alignment.centerLeft,
                                  child: new Text(
                                    album.dissname,
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 0.3),
                                      fontSize: 14
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList()
                );
              } else if (snapshot.hasError) {
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
            },
        );
      
    }
}