
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart';
import 'package:device_info/device_info.dart';
import 'dart:ui' as ui;


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

  getDevice() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('Running on ${androidInfo.model}');  // e.g. "Moto G (4)"

    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    print('Running on ${iosInfo.utsname.machine}');
  }


  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(widget.url.toString()),
      autoInitialize: true,
      autoPlay: true,
    );
    this.getDevice();
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
    super.dispose();
  }
  bool isPlaying=true;


  @override
  Widget build(BuildContext context) {


    bool isTablet;
    bool isPhone;

    final double devicePixelRatio = ui.window.devicePixelRatio;
    final ui.Size size = ui.window.physicalSize;
    final double width = size.width;
    final double height = size.height;


    if(devicePixelRatio < 2 && (width >= 1000 || height >= 1000)) {
      isTablet = true;
      isPhone = false;
    }
    else if(devicePixelRatio == 2 && (width >= 1920 || height >= 1920)) {
      isTablet = true;
      isPhone = false;
    }
    else {
      isTablet = false;
      isPhone = true;
    }

    final orientation = MediaQuery.of(context).orientation;
    Size size1=MediaQuery.of(context).size;

    Duration position = flickManager.flickVideoManager.videoPlayerValue.position;


    if(isPhone==false){
     // print(MediaQuery.of(context).size.width);
        return Shortcuts(
          shortcuts: <LogicalKeySet, Intent>{
            LogicalKeySet(LogicalKeyboardKey.select):ActivateIntent(),
          },
          
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Container(

              child: Stack(
                children: [
                  FlickVideoPlayer(
                    flickManager: flickManager,
                    flickVideoWithControls: FlickVideoWithControls(
                      willVideoPlayerControllerChange: false,
                      controls: Container(),

                    ),
                  ),
                  Positioned(
                    bottom: size1.height/10,
                    child: Container(
                      width: size1.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipOval(

                              child: Material(
                                  color: Colors.transparent,
                                  child: SizedBox(
                                      height: size.width/60,
                                      width: size.width/60,
                                      child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              flickManager.flickVideoManager.videoPlayerController.seekTo(position-Duration(seconds: 15));
                                              position=position-Duration(seconds: 15);
                                            });
                                          },
                                          child: Icon(Icons.fast_rewind,size: size.width/120,color: Colors.white,))))),

                          isPlaying?ClipOval(

                              child: Material(
                                  color: Colors.transparent,
                                  child: SizedBox(
                                      height: size.width/60,
                                      width: size.width/60,
                                      child: InkWell(
                                          onTap: (){
                                            flickManager.flickControlManager.pause();
                                            setState(() {
                                              isPlaying=false;
                                            });
                                          },
                                          child: Icon(Icons.pause,size: size.width/120,color: Colors.white,))))):
                          ClipOval(
                              child: Material(
                                  color: Colors.transparent,
                                  child: SizedBox(
                                      height: size.width/60,
                                      width: size.width/60,
                                      child: InkWell(
                                          onTap: (){
                                            flickManager.flickControlManager.play();
                                            setState(() {
                                              isPlaying=true;
                                            });
                                          },
                                          child: Icon(Icons.play_arrow,size: size.width/120,color: Colors.white,))))),
                          ClipOval(

                              child: Material(
                                  color: Colors.transparent,
                                  child: SizedBox(
                                      height: size.width/60,
                                      width: size.width/60,
                                      child: InkWell(
                                          onTap: (){
                                            setState(() {
                                              flickManager.flickVideoManager.videoPlayerController.seekTo(position+Duration(seconds: 15));
                                              position=position+Duration(seconds: 15);
                                            });
                                          },
                                          child: Icon(Icons.fast_forward,size: size.width/120,color: Colors.white,))))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
              preferredSize:  Size.fromHeight(size1.height/15),
              child: AppBar(title: Text("Circle Network"),backgroundColor: Colors.black,centerTitle: true,leadingWidth: 30,)),
          body: Stack(
            children: [
              Container(
                height: size1.width,
                width: size1.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Shortcuts(
                    shortcuts: <LogicalKeySet, Intent>{
                      LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
                    },
                    child: FlickVideoPlayer(
                      flickManager: flickManager,


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




