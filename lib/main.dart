import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Youtube Player Demo',
      home: MyHomePage(title: 'Youtube Player Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  YoutubePlayerController _controller = YoutubePlayerController();

  String _videoId = "WCobjTfojw0";

  @override
  void deactivate() {
    // This pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  Widget videoPlayer() {
    /// Youtube player that contains the video
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black, offset: new Offset(0, 1)),
      ]),
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),

      /// Spacing the player from top
      child: YoutubePlayer(
        context: context,
        videoId: _videoId,
        flags: YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          forceHideAnnotation: true,
          showVideoProgressIndicator: true,
          disableDragSeek: false,
        ),
        videoProgressIndicatorColor: Color(0xFFFF0000),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20.0,
            ),
            onPressed: () {},
          ),
          Text(
            'Hello! This is a test title.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {},
          ),
        ],
        progressColors: ProgressColors(
          playedColor: Color(0xFFFF0000),
          handleColor: Color(0xFFFF4433),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = new TextStyle( /// Style of the [Title] widget
        fontFamily: "DINCondensed-Bold",
        fontSize: 25,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(-1, 1),
            blurRadius: 1.0,
            color: Colors.black,
          ),
        ]);
    final descrStyle = new TextStyle(
      fontFamily: "DINCondensed-Bold",
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(176,176,176,1),
      shadows: <Shadow>[
          Shadow(
            offset: Offset(0, 0),
            blurRadius: 0,
            color: Colors.black.withOpacity(0.5),
          ),
        ]);


   

    return YoutubeScaffold(
      fullScreenOnOrientationChange: true,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                videoPlayer(), /// Player
                Padding(
                  /// Float back arrow
                  padding: EdgeInsets.only(
                      left: 8.0, top: MediaQuery.of(context).padding.top + 8),
                  child: new GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 35,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
            new Container( ///[Title] Widget
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 8, left: 8),
                child: new Text(
                  "Dj Dikkat Milletin Ruhuna Kayıyor",
                  style: titleStyle,
                )),
            new Container(
              alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 8, left: 8),
                child: new Text(
                  "Adam öldü amk",
                  style: descrStyle,
                ),
            ),           
          ],
        ),
      ),
    );
  }
}
