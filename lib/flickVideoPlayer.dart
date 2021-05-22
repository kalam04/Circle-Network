
import 'package:circle_network/mainDrawer.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;


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
    setState(() {
      SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
      SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    });


    flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.network(widget.url.toString()),
      autoInitialize: true,
      autoPlay: false,
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

    super.dispose();
  }

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




    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: PreferredSize(
      //     preferredSize:  Size.fromHeight(size.height/15),
      //     child: AppBar(title: Text("Circle Network"),backgroundColor: Colors.black,centerTitle: true,leadingWidth: 30,)),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: RotatedBox(
          quarterTurns: 1,
          child: Container(
            height: size.height-size.height/15,
            width: size.height,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FlickVideoPlayer(
                flickManager: flickManager,
                flickVideoWithControlsFullscreen: FlickVideoWithControls(
                  controls: FlickLandscapeControls(
                  ),
                ),

              ),
            ),
          ),
        ),
      ),

    );
  }
}


