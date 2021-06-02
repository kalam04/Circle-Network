

import 'package:chewie/chewie.dart';
import 'package:circle_network/mainDrawer.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

import 'landscape_player_controls.dart';


class Playvideo extends StatefulWidget {
  var name,url,Cat_id,id,data;
  Playvideo({this.name,this.url,this.Cat_id,this.id,this.data});

  @override
  _PlayvideoState createState() => _PlayvideoState(name,url,Cat_id,id,data);
}

class _PlayvideoState extends State<Playvideo> {

  FlickManager flickManager;

  _PlayvideoState(name, url, cat_id, id, data);

  var next,previous;




  void initState() {



    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(widget.url.toString()),
      autoInitialize: true,
      autoPlay: true,

    );




  }

  final spinkit = SpinKitWave(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.yellow[200] : Colors.grey,
        ),
      );
    },
  );


  @override
  void dispose() {
    flickManager.dispose();
    // setState(() {
    //   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]);
    // });

    super.dispose();
  }
  bool isPlaying=true;



  @override
  Widget build(BuildContext context) {



    final orientation = MediaQuery.of(context).orientation;
    if(widget.id==0){
      next=widget.id+1;
      previous=widget.data[widget.Cat_id]["movies"].length-1;
      // print(previous);
    }else{
      next=widget.id+1;
      previous=widget.id-1;
    }
    if(widget.id==widget.data[widget.Cat_id]["movies"].length-1){
      next=0;
      previous=widget.id-1;
    }
    Size size=MediaQuery.of(context).size;
    print(MediaQuery.of(context).orientation);

    print(size.width.toString()+"     "+size.height.toString());


    Duration position = flickManager.flickVideoManager.videoPlayerValue.position;
    print(position);



    if(MediaQuery.of(context).orientation==Orientation.portrait){
      print("work");
      return Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.select):ActivateIntent(),
        },
        //autofocus: true,
        //focusNode: _focusNode,

        child: Scaffold(
          backgroundColor: Colors.black,
          // appBar: PreferredSize(
          //     preferredSize:  Size.fromHeight(size.height/15),
          //     child: AppBar(title: Text("Circle Network"),backgroundColor: Colors.black,centerTitle: true,leadingWidth: 30,)),
          body: Stack(
            children: [
              FlickVideoPlayer(
                flickManager: flickManager,
              ),
              Positioned(
                bottom: size.height/10,
                child: Container(
                  color: Colors.transparent,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton(
                          elevation: 0,
                          color: Colors.transparent,
                          disabledColor: Colors.transparent,
                          child: Container(
                            height: size.height/20,
                            child: Padding(
                              padding:  EdgeInsets.all(size.width/50),
                              child: Icon(Icons.fast_rewind,color: Colors.white,),
                            ),
                          ),
                          onPressed: (){
                            print(position);
                            // flickManager.flickControlManager.play();

                            flickManager.flickVideoManager.videoPlayerController.seekTo(position-Duration(minutes: 1));
                            setState(() {
                              //flickManager.flickControlManager.pause();
                              position=position-Duration(minutes: 1);
                              flickManager.flickControlManager.play();
                              print(position);
                            });

                          }),
                      RaisedButton(
                        disabledColor: Colors.transparent,
                          elevation: 0,
                          color: Colors.transparent,
                          child: Container(
                            height: size.height/20,
                            child: Padding(
                              padding:  EdgeInsets.all(size.width/50),
                              child: isPlaying?Icon(Icons.pause,color: Colors.white,):Icon(Icons.play_arrow,color: Colors.white,),

                            ),
                          ),
                          onPressed: (){
                            if(isPlaying==true){
                              flickManager.flickControlManager.pause();
                              setState(() {
                                isPlaying=false;
                              });
                            }else{
                              flickManager.flickControlManager.play();
                              setState(() {
                                isPlaying=true;
                              });

                            }


                          }),
                      RaisedButton(
                        elevation: 0,
                        color: Colors.transparent,
                        disabledColor: Colors.transparent,
                          child: Container(
                            height: size.height/20,
                            child: Padding(
                              padding:  EdgeInsets.all(size.width/50),
                              child: Icon(Icons.fast_forward,color: Colors.white,),
                            ),
                          ),
                          onPressed: (){
                            print(position);
                            // flickManager.flickControlManager.play();
                            flickManager.flickVideoManager.videoPlayerController.seekTo(position+Duration(minutes: 1));
                            setState(() {
                              //flickManager.flickControlManager.pause();
                              position=position+Duration(minutes: 1);
                              flickManager.flickControlManager.play();
                              print(position);
                            });

                          }),

                    ],
                  ),
                ),
              ),

            ],
          ),

        ),
      );
    }else{
      return Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: PreferredSize(
              preferredSize:  Size.fromHeight(size.height/15),
              child: AppBar(title: Text("Circle Network"),backgroundColor: Colors.black,centerTitle: true,leadingWidth: 30,)),
          body: Stack(
            children: [
              Container(
                height: size.width,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Shortcuts(
                    shortcuts: <LogicalKeySet, Intent>{
                      LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
                    },
                    child: FlickVideoPlayer(
                      flickManager: flickManager,

                      wakelockEnabled: true,
                    ),
                  ),
                ),
              ),
            ],
          ),

        ),
      );
    }



  }


}

//
// class VideoPlayerScreen extends StatefulWidget {
//   VideoPlayerScreen({Key key, this.url}) : super(key: key);
//
//   final String url;
//
//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }
//
// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   VideoPlayerController _controller;
//   Future<void> _initializeVideoPlayerFuture;
//
//   // final FocusNode _focusNode = FocusNode();
//
//   var _playBackPosition = 0;
//   var _videoLength = '';
//   var _playBackFomattedPosition = '';
//   bool _controls = false;
//
//   @override
//   void initState() {
//     _controller = VideoPlayerController.network(
//       "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
//     );
//     _initializeVideoPlayerFuture = _controller.initialize();
//
//     _controls = true;
//
//     _controller.play();
//
//     Future.delayed(const Duration(seconds: 5), () {
//       _controls = false;
//     });
//
//     _controller.addListener(() {
//       var minutesTotal = (_controller.value.duration.inSeconds ~/ 60)
//           .toString()
//           .padLeft(1, '0');
//       var secondsTotal = (_controller.value.duration.inSeconds % 60)
//           .toString()
//           .padLeft(2, '0');
//       _videoLength = "$minutesTotal:$secondsTotal";
//
//       _playBackPosition = _controller.value.position.inSeconds;
//       var minutes = (_playBackPosition ~/ 60).toString().padLeft(1, '0');
//       var seconds = (_playBackPosition % 60).toString().padLeft(2, '0');
//       setState(() {
//         _playBackPosition = _playBackPosition;
//         _playBackFomattedPosition = "$minutes:$seconds / $_videoLength";
//       });
//     });
//
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void controls() {
//     setState(() {
//       _controls = true;
//       Future.delayed(const Duration(seconds: 5), () {
//         _controls = false;
//       });
//     });
//   }
//
//   // _handleKeyEvent(RawKeyEvent event) {
//   //   setState(() {
//   //     if (event.logicalKey == LogicalKeyboardKey.arrowLeft ||
//   //         event.logicalKey == LogicalKeyboardKey.arrowRight ||
//   //         event.logicalKey == LogicalKeyboardKey.arrowDown ||
//   //         event.logicalKey == LogicalKeyboardKey.arrowUp) {
//   //       controls();
//   //     }
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//
//     if(MediaQuery.of(context).orientation==Orientation.landscape){
//       return Shortcuts(
//         shortcuts: <LogicalKeySet, Intent>{
//           LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
//         },
//         child: Scaffold(
//           body: FutureBuilder(
//             future: _initializeVideoPlayerFuture,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: Stack(
//                     alignment: Alignment.bottomCenter,
//                     children: <Widget>[
//                       // RawKeyboardListener(
//                       //   focusNode: _focusNode,
//                       //   onKey: (RawKeyEvent event){
//                       //     if(!_controls) {
//                       //       _handleKeyEvent(event);
//                       //     }
//                       //   },
//                       //   child: VideoPlayer(_controller),
//                       // ),
//                       VideoPlayer(_controller),
//                       AnimatedSwitcher(
//                         duration: Duration(milliseconds: 500),
//                         reverseDuration: Duration(milliseconds: 500),
//                         child: _controls
//                             ? Positioned(
//                           bottom: 0,
//                           child: Container(
//                             height: 120,
//                             color: Colors.black54,
//                           ),
//                         )
//                             : null,
//                       ),
//                       Positioned(
//                         bottom: 50.0,
//                         left: 20.0,
//                         child: Center(
//                           child: Text(
//                             '$_playBackFomattedPosition',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 50.0,
//                         right: 160.0,
//                         child: RawMaterialButton(
//                           shape: CircleBorder(),
//                           padding: const EdgeInsets.all(10.0),
//                           focusColor: Colors.grey[600],
//                           fillColor: Colors.black,
//                           // autofocus: true,
//                           child: Icon(
//                             _controller.value.isPlaying
//                                 ? Icons.pause
//                                 : Icons.play_arrow,
//                             size: 28,
//                             color: Colors.white,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               if (_controller.value.isPlaying) {
//                                 controls();
//                                 _controller.pause();
//                               } else {
//                                 _controller.play();
//                               }
//                             });
//                           },
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 50.0,
//                         right: 80.0,
//                         child: RawMaterialButton(
//                           shape: CircleBorder(),
//                           padding: const EdgeInsets.all(10.0),
//                           focusColor: Colors.grey[600],
//                           fillColor: Colors.black,
//                           child: Icon(
//                             Icons.arrow_left,
//                             size: 28,
//                             color: Colors.white,
//                           ),
//                           onPressed: () {
//                             controls();
//                             _controller
//                                 .seekTo(Duration(seconds: _playBackPosition - 10));
//                           },
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 50.0,
//                         right: 0.0,
//                         child: RawMaterialButton(
//                           shape: CircleBorder(),
//                           padding: const EdgeInsets.all(10.0),
//                           focusColor: Colors.grey[600],
//                           fillColor: Colors.black,
//                           child: Icon(
//                             Icons.arrow_right,
//                             size: 28,
//                             color: Colors.white,
//                           ),
//                           onPressed: () {
//                             controls();
//                             _controller
//                                 .seekTo(Duration(seconds: _playBackPosition + 10));
//                           },
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 5.0,
//                         left: 20.0,
//                         right: 20.0,
//                         child: Slider(
//                           activeColor: Colors.red[900],
//                           value: _playBackPosition.toDouble(),
//                           min: 0,
//                           max: _controller.value.duration.inSeconds.toDouble(),
//                           onChanged: (v) {
//                             controls();
//                             _controller.seekTo(Duration(seconds: v.toInt()));
//                           },
//                         ),
//                       ),
//                       VideoProgressIndicator(_controller, allowScrubbing: true),
//                     ],
//                   ),
//                 );
//               } else {
//                 return Center(child: CircularProgressIndicator());
//               }
//             },
//           ),
//         ),
//       );
//     }
//
//   }
// }
//
//
//
// class ChewieDemo extends StatefulWidget {
//   const ChewieDemo({
//     Key key,
//     this.title = 'Chewie Demo',
//   }) : super(key: key);
//
//   final String title;
//
//   @override
//   State<StatefulWidget> createState() {
//     return _ChewieDemoState();
//   }
// }
//
// class _ChewieDemoState extends State<ChewieDemo> {
//   TargetPlatform _platform;
//    VideoPlayerController _videoPlayerController1;
//    VideoPlayerController _videoPlayerController2;
//   ChewieController _chewieController;
//
//   @override
//   void initState() {
//     super.initState();
//     initializePlayer();
//   }
//
//   @override
//   void dispose() {
//     _videoPlayerController1.dispose();
//     _videoPlayerController2.dispose();
//     _chewieController?.dispose();
//     super.dispose();
//   }
//
//   Future<void> initializePlayer() async {
//     _videoPlayerController1 = VideoPlayerController.network(
//         'https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4');
//     _videoPlayerController2 = VideoPlayerController.network(
//         'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4');
//     await Future.wait([
//       _videoPlayerController1.initialize(),
//       _videoPlayerController2.initialize()
//     ]);
//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController1,
//       autoPlay: true,
//       looping: true,
//       subtitle: Subtitles([
//         Subtitle(
//           index: 0,
//           start: Duration.zero,
//           end: const Duration(seconds: 10),
//           text: 'Hello from subtitles',
//         ),
//         Subtitle(
//           index: 0,
//           start: const Duration(seconds: 10),
//           end: const Duration(seconds: 20),
//           text: 'Whats up? :)',
//         ),
//       ]),
//       subtitleBuilder: (context, subtitle) => Container(
//         padding: const EdgeInsets.all(10.0),
//         child: Text(
//           subtitle,
//           style: const TextStyle(color: Colors.white),
//         ),
//       ),
//       // Try playing around with some of these other options:
//
//       // showControls: false,
//       // materialProgressColors: ChewieProgressColors(
//       //   playedColor: Colors.red,
//       //   handleColor: Colors.blue,
//       //   backgroundColor: Colors.grey,
//       //   bufferedColor: Colors.lightGreen,
//       // ),
//       // placeholder: Container(
//       //   color: Colors.grey,
//       // ),
//       // autoInitialize: true,
//     );
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if(MediaQuery.of(context).orientation==Orientation.landscape){
//       return Shortcuts(
//         shortcuts: <LogicalKeySet, Intent>{
//           LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
//         },
//         child: MaterialApp(
//           title: widget.title,
//
//           home: Scaffold(
//             appBar: AppBar(
//               title: Text(widget.title),
//             ),
//             body: Column(
//               children: <Widget>[
//                 Expanded(
//                   child: Center(
//                     child: _chewieController != null &&
//                         _chewieController
//                             .videoPlayerController.value.isInitialized
//                         ? Chewie(
//                       controller: _chewieController,
//                     )
//                         : Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//                         CircularProgressIndicator(),
//                         SizedBox(height: 20),
//                         Text('Loading'),
//                       ],
//                     ),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     _chewieController?.enterFullScreen();
//                   },
//                   child: const Text('Fullscreen'),
//                 ),
//                 Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: TextButton(
//                         onPressed: () {
//                           setState(() {
//                             _chewieController?.dispose();
//                             _videoPlayerController1.pause();
//                             _videoPlayerController1.seekTo(const Duration());
//                             _chewieController = ChewieController(
//                               videoPlayerController: _videoPlayerController1,
//                               autoPlay: true,
//                               looping: true,
//                               subtitle: Subtitles([
//                                 Subtitle(
//                                   index: 0,
//                                   start: Duration.zero,
//                                   end: const Duration(seconds: 10),
//                                   text: 'Hello from subtitles',
//                                 ),
//                                 Subtitle(
//                                   index: 0,
//                                   start: const Duration(seconds: 10),
//                                   end: const Duration(seconds: 20),
//                                   text: 'Whats up? :)',
//                                 ),
//                               ]),
//                               subtitleBuilder: (context, subtitle) => Container(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Text(
//                                   subtitle,
//                                   style: const TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             );
//                           });
//                         },
//                         child: const Padding(
//                           padding: EdgeInsets.symmetric(vertical: 16.0),
//                           child: Text("Landscape Video"),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: TextButton(
//                         onPressed: () {
//                           setState(() {
//                             _chewieController?.dispose();
//                             _videoPlayerController2.pause();
//                             _videoPlayerController2.seekTo(const Duration());
//                             _chewieController = ChewieController(
//                               videoPlayerController: _videoPlayerController2,
//                               autoPlay: true,
//                               looping: true,
//                               /* subtitle: Subtitles([
//                               Subtitle(
//                                 index: 0,
//                                 start: Duration.zero,
//                                 end: const Duration(seconds: 10),
//                                 text: 'Hello from subtitles',
//                               ),
//                               Subtitle(
//                                 index: 0,
//                                 start: const Duration(seconds: 10),
//                                 end: const Duration(seconds: 20),
//                                 text: 'Whats up? :)',
//                               ),
//                             ]),
//                             subtitleBuilder: (context, subtitle) => Container(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Text(
//                                 subtitle,
//                                 style: const TextStyle(color: Colors.white),
//                               ),
//                             ), */
//                             );
//                           });
//                         },
//                         child: const Padding(
//                           padding: EdgeInsets.symmetric(vertical: 16.0),
//                           child: Text("Portrait Video"),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: TextButton(
//                         onPressed: () {
//                           setState(() {
//                             _platform = TargetPlatform.android;
//                           });
//                         },
//                         child: const Padding(
//                           padding: EdgeInsets.symmetric(vertical: 16.0),
//                           child: Text("Android controls"),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: TextButton(
//                         onPressed: () {
//                           setState(() {
//                             _platform = TargetPlatform.iOS;
//                           });
//                         },
//                         child: const Padding(
//                           padding: EdgeInsets.symmetric(vertical: 16.0),
//                           child: Text("iOS controls"),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: TextButton(
//                         onPressed: () {
//                           setState(() {
//                             _platform = TargetPlatform.windows;
//                           });
//                         },
//                         child: const Padding(
//                           padding: EdgeInsets.symmetric(vertical: 16.0),
//                           child: Text("Desktop controls"),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//
//   }
// }


class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key, this.url}) : super(key: key);

  final String url;

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  // final FocusNode _focusNode = FocusNode();

  var _playBackPosition = 0;
  var _videoLength = '';
  var _playBackFomattedPosition = '';
  bool _controls = false;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      widget.url,
    );
    _initializeVideoPlayerFuture = _controller.initialize();

    _controls = true;

    _controller.play();

    Future.delayed(const Duration(seconds: 1), () {
      _controls = false;
    });

    _controller.addListener(() {
      var minutesTotal = (_controller.value.duration.inSeconds ~/ 60)
          .toString()
          .padLeft(1, '0');
      var secondsTotal = (_controller.value.duration.inSeconds % 60)
          .toString()
          .padLeft(2, '0');
      _videoLength = "$minutesTotal:$secondsTotal";

      _playBackPosition = _controller.value.position.inSeconds;
      var minutes = (_playBackPosition ~/ 60).toString().padLeft(1, '0');
      var seconds = (_playBackPosition % 60).toString().padLeft(2, '0');
      setState(() {
        _playBackPosition = _playBackPosition;
        _playBackFomattedPosition = "$minutes:$seconds / $_videoLength";
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void controls() {
    setState(() {
      _controls = true;
      Future.delayed(const Duration(seconds: 1), () {
        _controls = false;
      });
    });
  }

  // _handleKeyEvent(RawKeyEvent event) {
  //   setState(() {
  //     if (event.logicalKey == LogicalKeyboardKey.arrowLeft ||
  //         event.logicalKey == LogicalKeyboardKey.arrowRight ||
  //         event.logicalKey == LogicalKeyboardKey.arrowDown ||
  //         event.logicalKey == LogicalKeyboardKey.arrowUp) {
  //       controls();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

    if(MediaQuery.of(context).orientation==Orientation.portrait){
      return Scaffold(
        body: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    // RawKeyboardListener(
                    //   focusNode: _focusNode,
                    //   onKey: (RawKeyEvent event){
                    //     if(!_controls) {
                    //       _handleKeyEvent(event);
                    //     }
                    //   },
                    //   child: VideoPlayer(_controller),
                    // ),
                    VideoPlayer(_controller),
                    // AnimatedSwitcher(
                    //   duration: Duration(milliseconds: 500),
                    //   reverseDuration: Duration(milliseconds: 500),
                    //   child: _controls
                    //       ? Positioned(
                    //     bottom: 0,
                    //     child: Container(
                    //       height: 120,
                    //       color: Colors.black54,
                    //     ),
                    //   )
                    //       : null,
                    // ),
                    Positioned(
                      bottom: 50.0,
                      left: 20.0,
                      child: Center(
                        child: Text(
                          '$_playBackFomattedPosition',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    // Positioned(
                    //   bottom: 50.0,
                    //   right: 160.0,
                    //   child: RawMaterialButton(
                    //     shape: CircleBorder(),
                    //     padding: const EdgeInsets.all(10.0),
                    //     focusColor: Colors.grey[600],
                    //     fillColor: Colors.black,
                    //     // autofocus: true,
                    //     child: Icon(
                    //       _controller.value.isPlaying
                    //           ? Icons.pause
                    //           : Icons.play_arrow,
                    //       size: 28,
                    //       color: Colors.white,
                    //     ),
                    //     onPressed: () {
                    //       setState(() {
                    //         if (_controller.value.isPlaying) {
                    //           controls();
                    //           _controller.pause();
                    //         } else {
                    //           _controller.play();
                    //         }
                    //       });
                    //     },
                    //   ),
                    // ),
                    // Positioned(
                    //   bottom: 50.0,
                    //   right: 80.0,
                    //   child: RawMaterialButton(
                    //     shape: CircleBorder(),
                    //     padding: const EdgeInsets.all(10.0),
                    //     focusColor: Colors.grey[600],
                    //     fillColor: Colors.black,
                    //     child: Icon(
                    //       Icons.arrow_left,
                    //       size: 28,
                    //       color: Colors.white,
                    //     ),
                    //     onPressed: () {
                    //       controls();
                    //       _controller
                    //           .seekTo(Duration(seconds: _playBackPosition - 10));
                    //     },
                    //   ),
                    // ),
                    // Positioned(
                    //   bottom: 50.0,
                    //   right: 0.0,
                    //   child: RawMaterialButton(
                    //     shape: CircleBorder(),
                    //     padding: const EdgeInsets.all(10.0),
                    //     focusColor: Colors.grey[600],
                    //     fillColor: Colors.black,
                    //     child: Icon(
                    //       Icons.arrow_right,
                    //       size: 28,
                    //       color: Colors.white,
                    //     ),
                    //     onPressed: () {
                    //       controls();
                    //       _controller
                    //           .seekTo(Duration(seconds: _playBackPosition + 10));
                    //     },
                    //   ),
                    // ),
                    Positioned(
                      bottom: 5.0,
                      left: 20.0,
                      right: 20.0,
                      child: Slider(
                        activeColor: Colors.red[900],
                        value: _playBackPosition.toDouble(),
                        min: 0,
                        max: _controller.value.duration.inSeconds.toDouble(),
                        onChanged: (v) {
                          controls();
                          _controller.seekTo(Duration(seconds: v.toInt()));
                        },
                      ),
                    ),
                    VideoProgressIndicator(_controller, allowScrubbing: true),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      );
    }else{
      return Scaffold(
        body: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                height: size.height,
                width: size.width,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    // RawKeyboardListener(
                    //   focusNode: _focusNode,
                    //   onKey: (RawKeyEvent event){
                    //     if(!_controls) {
                    //       _handleKeyEvent(event);
                    //     }
                    //   },
                    //   child: VideoPlayer(_controller),
                    // ),
                    VideoPlayer(_controller),
                    // AnimatedSwitcher(
                    //   duration: Duration(milliseconds: 500),
                    //   reverseDuration: Duration(milliseconds: 500),
                    //   child: _controls
                    //       ? Positioned(
                    //     bottom: 0,
                    //     child: Container(
                    //       height: 120,
                    //       color: Colors.black54,
                    //     ),
                    //   )
                    //       : null,
                    // ),
                    Positioned(
                      bottom: 50.0,
                      left: 20.0,
                      child: Center(
                        child: Text(
                          '$_playBackFomattedPosition',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    // Positioned(
                    //   bottom: 50.0,
                    //   right: 160.0,
                    //   child: RawMaterialButton(
                    //     shape: CircleBorder(),
                    //     padding: const EdgeInsets.all(10.0),
                    //     focusColor: Colors.grey[600],
                    //     fillColor: Colors.black,
                    //     // autofocus: true,
                    //     child: Icon(
                    //       _controller.value.isPlaying
                    //           ? Icons.pause
                    //           : Icons.play_arrow,
                    //       size: 28,
                    //       color: Colors.white,
                    //     ),
                    //     onPressed: () {
                    //       setState(() {
                    //         if (_controller.value.isPlaying) {
                    //           controls();
                    //           _controller.pause();
                    //         } else {
                    //           _controller.play();
                    //         }
                    //       });
                    //     },
                    //   ),
                    // ),
                    // Positioned(
                    //   bottom: 50.0,
                    //   right: 80.0,
                    //   child: RawMaterialButton(
                    //     shape: CircleBorder(),
                    //     padding: const EdgeInsets.all(10.0),
                    //     focusColor: Colors.grey[600],
                    //     fillColor: Colors.black,
                    //     child: Icon(
                    //       Icons.arrow_left,
                    //       size: 28,
                    //       color: Colors.white,
                    //     ),
                    //     onPressed: () {
                    //       controls();
                    //       _controller
                    //           .seekTo(Duration(seconds: _playBackPosition - 10));
                    //     },
                    //   ),
                    // ),
                    // Positioned(
                    //   bottom: 50.0,
                    //   right: 0.0,
                    //   child: RawMaterialButton(
                    //     shape: CircleBorder(),
                    //     padding: const EdgeInsets.all(10.0),
                    //     focusColor: Colors.grey[600],
                    //     fillColor: Colors.black,
                    //     child: Icon(
                    //       Icons.arrow_right,
                    //       size: 28,
                    //       color: Colors.white,
                    //     ),
                    //     onPressed: () {
                    //       controls();
                    //       _controller
                    //           .seekTo(Duration(seconds: _playBackPosition + 10));
                    //     },
                    //   ),
                    // ),
                    Positioned(
                      bottom: 5.0,
                      left: 20.0,
                      right: 20.0,
                      child: Slider(
                        activeColor: Colors.red[900],
                        value: _playBackPosition.toDouble(),
                        min: 0,
                        max: _controller.value.duration.inSeconds.toDouble(),
                        onChanged: (v) {
                          controls();
                          _controller.seekTo(Duration(seconds: v.toInt()));
                        },
                      ),
                    ),
                    VideoProgressIndicator(_controller, allowScrubbing: true),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      );

    }

  }
}




