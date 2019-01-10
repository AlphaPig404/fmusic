import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
  final List<String> items = List.generate(100, (i)=> '$i');

  // MusicList({Key key, @required this.items}) : super(key: key);

  @override
    Widget build(BuildContext context) {
      return new Column(
        children: items.map((i){
          return new Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: new Row(
              children: <Widget>[
                new Container(
                  width: 50,
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: new Image.network(
                    'http://p.qpic.cn/music_cover/UCJDptU3vGgQt6PS5Hn6C4bRvG8vOU4rhFKYfJq8FbjnSA94E5JuaA/600?n=1'
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
                          'data',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16
                          ),
                        ),
                      ),
                      new Container(
                        alignment: Alignment.centerLeft,
                        child: new Text(
                          'hellow',
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
    }
}