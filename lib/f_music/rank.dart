import 'package:flutter/material.dart';

class RankPage extends StatelessWidget{
  RankPage({Key key}):super(key: key);
  final List mockData = List.filled(100, 1);
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new ListView(
        children: mockData.map((i){
          return new Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            color: Color.fromRGBO(51, 51, 51, 1),
            child: new Row(
              children: <Widget>[
                new Container(
                  width: 100,
                  height: 100,
                  child: new Image.network(
                    'http://y.gtimg.cn/music/photo_new/T003R300x300M000003hGUkO14Ru3k.jpg'
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.filled(3, 1).map((i){
                      return new Text(
                          '1 不为谁而作的歌-林俊杰',
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