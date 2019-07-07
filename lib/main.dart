import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import 'dart:ui' as ui;

void main() {
  runApp(MyApp());
}
///
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

     VideoPlayerController _videoPlayerController1;
    ChewieController _chewieController;

    @override
    void initState() { 
      super.initState();
      _videoPlayerController1 = VideoPlayerController.network(
        'https://r3---sn-4g5e6nsd.googlevideo.com/videoplayback?expire=1562545619&ei=czkiXabdEo2l-gar3J44&ip=94.121.168.0&id=o-ALZa5qePqSVYSuFwnyMn_GxjF3X67_OqNuO5nO2Pobxi&itag=18&source=youtube&requiressl=yes&mm=31%2C26&mn=sn-4g5e6nsd%2Csn-nv47lns7&ms=au%2Conr&mv=m&mvi=2&pl=20&gcr=tr&initcwndbps=405000&mime=video%2Fmp4&gir=yes&clen=19632636&ratebypass=yes&dur=252.215&lmt=1540073319413428&mt=1562523938&fvip=3&c=WEB&txp=5531432&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cgcr%2Cmime%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&lsparams=mm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AHylml4wRQIgPgJluIkMMgB6kbBU4-JOrWFnXNjwhwbVvg6fztqU6OkCIQDGo0p5EkVhhCsbMUjihMoB9l8a02TwOl-G47Ge4J38bA%3D%3D&sig=ALgxI2wwRQIgC9XfivFYtQ5zeD055VelpnwE1RJhtpwcQmwNysWcpxsCIQCUIZ4Lbe8-Rt8xZ3xKML6kMnIYGh-ocrMKAfr9GitlGA==');

       _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );

    }
@override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  Widget videoPlayer() {
    /// Youtube player that contains the video
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black, offset: new Offset(0, 1)),
      ]),
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),

      /// Spacing the player from top
      child: new  Chewie(
                  controller: _chewieController,
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


   

    return  Scaffold(
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
      
    );
  }
}
