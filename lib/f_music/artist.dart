import 'package:flutter/material.dart';

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

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new ListView(
        children: mockData.map((i){
          return new ListTile(
            leading: CircleAvatar(
               backgroundImage: NetworkImage(
                 'https://y.gtimg.cn/music/photo_new/T001R300x300M0000025NhlN2yWrP4.jpg?max_age=2592000'
               )
            ),
            title: new Text('周杰伦',
              style: new TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.5),
                fontSize: 14
              ),
            ),
          );
        }).toList()
      );
    }
}