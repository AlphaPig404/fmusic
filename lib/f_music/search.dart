import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget{
  const SearchPage({Key key}):super(key: key);
  @override
    Widget build(BuildContext context) {
      return new Container(
        child: new Column(
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.all(10),
              color: Color.fromRGBO(51, 51, 51, 1),
              child: new TextField(
                decoration: new InputDecoration(
                  prefixIcon: new Icon(Icons.search),
                  hintText: '搜索歌曲、歌手'
                )
              ),
            ),
            new SearchResult()
          ],
        ),
      );
    }
}

class SearchResult extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      return new Container(
        padding: const EdgeInsets.all(10),
        child: new Column(
          children: <Widget>[
            new Container(
              alignment: Alignment.centerLeft,
              height: 40,
              child: new Text(
                '热门搜索',
                style: new TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.5)
                ),
              )
            ),
            new Wrap(
              children: List.filled(8, 1).map((i){
                return new Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: new Chip(
                    backgroundColor: Color.fromRGBO(51, 51, 51, 1),
                    labelStyle: new TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.3)
                    ),
                    labelPadding: const EdgeInsets.all(0),
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    label:  new Text('周杰伦'),
                  )
                );
              }).toList()
            )
          ],
        ),
      );
    }
}