import 'package:flutter/material.dart';
import 'dart:ui';
import './audioPlayer.dart';

final GlobalKey<PlayerState> musicPlayerKey = new GlobalKey();

const String coverArt =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEKU9rkbdInt9fPTlJMjT_gbwlyBqbE60zELhHy_A2yMsJkBmDTw',
    mp3Url = 'http://music.163.com/song/media/outer/url?id=451703096.mp3';


class Player extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      return new Theme(
        data: ThemeData(
          primaryColor: Theme.of(context).primaryColor
        ),
        child:  Stack(
            children: <Widget>[
              new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage('https://y.gtimg.cn/music/photo_new/T001R300x300M0000025NhlN2yWrP4.jpg?max_age=2592000'),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                    Colors.black54,
                    BlendMode.overlay,
                  ),
                ),
              ),
            ),
            new Container(
              child: new BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Opacity(
                opacity: 0.6,
                child: new Container(
                  decoration: new BoxDecoration(
                    color: Colors.grey.shade900,
                  ),
                ),
              ),
            )),
            _buildContent(context)
            ],
          )
      );
    }

    
    Widget _buildContent(context){
      return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.keyboard_arrow_down),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: (){
                  
                }
              )
            ],
            title: Text('告白气球'),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(),
              ),
              MyPlayer(
                  onError: (e) {
                    Scaffold.of(context).showSnackBar(
                      new SnackBar(
                        content: new Text(e),
                      ),
                    );
                  },
                  onPrevious: () {},
                  onNext: () {},
                  onCompleted: () {},
                  onPlaying: (isPlaying) {
                    // if (isPlaying) {
                    //   controller_record.forward();
                    //   controller_needle.forward();
                    // } else {
                    //   controller_record.stop(canceled: false);
                    //   controller_needle.reverse();
                    // }
                  },
                  key: musicPlayerKey,
                  color: Colors.white,
                  audioUrl: mp3Url,
                ),
            ],
          )
      );
    }
}