import 'package:flutter/material.dart';
import 'package:movie_trailer/global_widget/video_player.dart';
import 'package:movie_trailer/models/detail_argrument.dart';
import 'package:tlrt_lib/text_contrast/text_contrast.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = 'detail-screen';

  const DetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments as DetailArgrument;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.tag),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // TlrtVideoPlayer(
            //   videoPath: 'assets/videos/SPIDER-MAN_NO_WAY_HOME.mp4',
            //   width: double.infinity,
            //   height: size.height * 0.6,
            // ),
            // VideoPlayerWidget(
            //   height: size.height * 0.5,
            //   width: double.infinity,
            // ),
            Row(
              children: [
                Hero(
                  tag: args.tag,
                  child: Image.network(
                    args.imagePath,
                    scale: 3,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextContrast(
                      data: args.tag,
                      backgroundColor: Colors.black,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
