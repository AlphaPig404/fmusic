import 'package:flutter/material.dart';
import 'recommend.dart';
import 'rank.dart';
import 'artist.dart';
import 'search.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(34, 34, 34, 1)
      ),
      home: new DefaultTextStyle(
        style: new TextStyle(
          fontSize: 14.0,
          color: Colors.white70,
        ),
        child: new TabbedApp(),
      )
    );
  }
}

class TabbedApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: tabPages.length,
      child: new Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: new AppBar(
          title: const Text('FMusic'),
          bottom: new TabBar(
            tabs: tabPages.map((TabPage tabPage){
              return new Tab(
                text: tabPage.title,
              );
            }).toList()
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.account_circle
              ),
              onPressed: (){
                print('account');
              },
            )
          ],
        ),
        body: TabBarView(
          children: tabPages.map((TabPage tabPage){
              return new Tab(
                child: tabPage.page
              );
            }).toList(),
        ),
      ),
    );
  }
}

List<TabPage> tabPages = <TabPage>[
  new TabPage(title:'推荐', page: new RecommentPage()),
  new TabPage(title:'歌手', page: new ArtistPage()),
  new TabPage(title:'排行', page: new RankPage()),
  new TabPage(title:'搜索', page: new SearchPage()),
];

class TabPage{
  const TabPage({ this.title, this.page });
  final String title;
  final Widget page;
}