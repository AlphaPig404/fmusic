// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:f_music/model/getSingerList.dart';
import 'package:f_music/model/getArtistList.dart';
import 'package:f_music/utils/http.dart';
import './player.dart';

class Singer extends StatefulWidget {
  Singer({this.artist});
  static const String routeName = '/singer';
  final Artist artist;
  
  @override
  SingerState createState() => SingerState();
}

enum AppBarBehavior { normal, pinned, floating, snapping }

class SingerState extends State<Singer> {
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final double _appBarHeight = 256.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.light,
        primarySwatch: MaterialColor(0xFF212121,
          <int, Color>{
            50: Color(0xFFA4A4BF),
            100: Color(0xFFA4A4BF),
            200: Color(0xFFA4A4BF),
            300: Color(0xFF9191B3),
            400: Color(0xFF7F7FA6),
            500: Color(0xFF212121),
            600: Color(0xFF6D6D99),
            700: Color(0xFF5B5B8D),
            800: Color(0xFF494980),
            900: Color(0xFF181861),
          },
        ),
        platform: Theme.of(context).platform,
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color.fromRGBO(34, 34, 34, 1),
        body: _buildSongList(),
      ),
    );
  }

  FutureBuilder _buildSongList(){
    Future<SingerResData> getSongList() async{
      final http = new MyHttp('c.y.qq.com','/v8/fcg-bin/fcg_v8_singer_track_cp.fcg',{
        'g_tk': '5381',
        'loginUin': '0',
        'singermid': '${widget.artist.fsingerMid}',
        'order': 'listen',
        'begin': '0',
        'num': '30',
        'songstatus': '1',
        'hostUin': '0',
        'format': 'json',
        'inCharset': 'utf-8',
        'outCharset': 'utf-8',
        'notice': '0',
        'platform': 'yqq',
        'needNewCode': '0',
        '_': '1547199635353',

        'channel': 'singer',
        'page': 'list',
      });
      final json = await http.get();
      return SingerResData.fromJson(json['data']);
    }
    
    return FutureBuilder<SingerResData>(
      future: getSongList(),
      builder: (context, snapshot){
        if (snapshot.hasData) {
          return _buildCustomView(snapshot.data.songList);
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
      },
    );
  }

  _buildCustomView(List<Song> list){
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: _appBarHeight,
          pinned: _appBarBehavior == AppBarBehavior.pinned,
          floating: _appBarBehavior == AppBarBehavior.floating || _appBarBehavior == AppBarBehavior.snapping,
          snap: _appBarBehavior == AppBarBehavior.snapping,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.create),
              tooltip: 'Edit',
              onPressed: () {
                _scaffoldKey.currentState.showSnackBar(const SnackBar(
                  content: Text("Editing isn't supported in this screen.")
                ));
              },
            ),
            PopupMenuButton<AppBarBehavior>(
              onSelected: (AppBarBehavior value) {
                setState(() {
                  _appBarBehavior = value;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuItem<AppBarBehavior>>[
                const PopupMenuItem<AppBarBehavior>(
                  value: AppBarBehavior.normal,
                  child: Text('App bar scrolls away')
                ),
                const PopupMenuItem<AppBarBehavior>(
                  value: AppBarBehavior.pinned,
                  child: Text('App bar stays put')
                ),
                const PopupMenuItem<AppBarBehavior>(
                  value: AppBarBehavior.floating,
                  child: Text('App bar floats')
                ),
                const PopupMenuItem<AppBarBehavior>(
                  value: AppBarBehavior.snapping,
                  child: Text('App bar snaps')
                ),
              ],
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            title: Text('${widget.artist.fsingerName}'),
            background: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.network(
                  'https://y.gtimg.cn/music/photo_new/T001R300x300M000${widget.artist.fsingerMid}.jpg?max_age=2592000',
                  fit: BoxFit.cover,
                  height: _appBarHeight,
                ),
                // This gradient ensures that the toolbar icons are distinct
                // against the background image.
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.0, -1.0),
                      end: Alignment(0.0, -0.4),
                      colors: <Color>[Color(0x80000000), Color(0x00000000)],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate(
              list.map((song) {
                return ListTile(
                  title: Text(
                    '${song.musicData.songname}',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  subtitle: Text(
                    '${song.musicData.albumname}',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.3)
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Player(),
                      fullscreenDialog: true,  
                    ));
                  },
                );
              }).toList()
            ),
        )
      ]
    );
  }
}

