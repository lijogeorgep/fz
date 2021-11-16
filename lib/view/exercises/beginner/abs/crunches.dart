
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';
class Crunches extends StatefulWidget {
  final String? url;
  final Widget pages;
  const Crunches({Key? key, this.url,required this.pages}) : super(key: key);


  @override
  _CrunchesState createState() => _CrunchesState();
}

class _CrunchesState extends State<Crunches> {
  FlickManager? flickManager;

  @override
  void initState() {
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(widget.url.toString()),

    );
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    flickManager!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: SafeArea(

  child:   SingleChildScrollView(
    child: Column(

      children: [
        SizedBox(

          height: MediaQuery.of(context).size.height/4*1.25,

          width: MediaQuery.of(context).size.width,


          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlickVideoPlayer(flickManager: flickManager!),
          ),



        ),
        const SizedBox(height: 20,),
        Align(
            alignment: Alignment.topLeft,
            child: widget.pages),


      ],

    ),
  ),
),
    );
  }
}


