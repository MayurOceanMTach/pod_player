import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class PlayVideoFromYoutube extends StatefulWidget {
  const PlayVideoFromYoutube({Key? key}) : super(key: key);

  @override
  State<PlayVideoFromYoutube> createState() => _PlayVideoFromVimeoIdState();
}

class _PlayVideoFromVimeoIdState extends State<PlayVideoFromYoutube> {
  final videoTextFieldCtr = TextEditingController();
  List<String> url = [
    "https://youtube.com/shorts/wwXxc8aPeMY?si=MXDNCxmnPWafaeLJ",
    "https://youtube.com/shorts/qWHYKLYmOJM?si=JHoTphf_19NXQZv0",
    "https://youtube.com/shorts/2xAQfy24udY?si=C4WQiJJxGZQU1MR7",
    "https://youtube.com/shorts/e7-B_tRTLKo",
    "https://youtube.com/shorts/Zs6HY2TzGAY",
    "https://youtube.com/shorts/FIZI3k7mTvA",
    "https://youtube.com/shorts/P_4M9pMfT4s",
    "https://youtube.com/shorts/p5DfhG_DKSk",
    "https://youtube.com/shorts/LLo9u8GYUU0",
    "https://youtube.com/shorts/AmBUmNuuk1A",
    "https://youtube.com/shorts/Ti4kppMc-ug",
    "https://youtube.com/shorts/mY9o6ol6Ra4",
    "https://youtube.com/shorts/BJ4ePOMaL6o",
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //   controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: url.length,
          itemBuilder: (context, index) {
            Uri uri = Uri.parse(url[index]);
            Uri cleanedUri = uri.replace(query: "");

            String cleanedUrl = cleanedUri.toString();
            String ur = cleanedUrl.replaceAll("?", "");

            //log(" - - - - - - - . . . . . . . . > > > > > > > $ur}");
            //log("cleanurl -> $cleanedUrl");
            url[index] = ur;
            //log(" - - - - - - - - - - - > ${url[index]}");
            late final PodPlayerController controller;
            controller = PodPlayerController(
              playVideoFrom: PlayVideoFrom.youtube(url[index]),
              podPlayerConfig: const PodPlayerConfig(
                isLooping: true,
                videoQualityPriority: [720, 360],
                autoPlay: true,
              ),
            )..initialise();
            return PodVideoPlayer(
              frameAspectRatio: MediaQuery.of(context).size.width / MediaQuery.of(context).size.height,
              videoAspectRatio: 9 / 16,
              controller: controller,
              hideControls: true,
              alwaysShowProgressBar: false,
              // videoThumbnail: const DecorationImage(
              //   image: NetworkImage(
              //     'https://images.unsplash.com/photo-1569317002804-ab77bcf1bce4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dW5zcGxhc2h8ZW58MHx8MHx8&w=1000&q=80',
              //   ),
              //   fit: BoxFit.cover,
              // ),
            );
          },
        ),
      ),
    );
  }

  // Row _loadVideoFromUrl() {
  //   return Row(
  //     children: [
  //       Expanded(
  //         flex: 2,
  //         child: TextField(
  //           controller: videoTextFieldCtr,
  //           decoration: const InputDecoration(
  //             labelText: 'Enter youtube url/id',
  //             floatingLabelBehavior: FloatingLabelBehavior.always,
  //             hintText: 'https://youtu.be/A3ltMaM6noM',
  //             border: OutlineInputBorder(),
  //           ),
  //         ),
  //       ),
  //       const SizedBox(width: 10),
  //       FocusScope(
  //         canRequestFocus: false,
  //         child: ElevatedButton(
  //           onPressed: () async {
  //             if (videoTextFieldCtr.text.isEmpty) {
  //               snackBar('Please enter the url');
  //               return;
  //             }
  //             try {
  //               snackBar('Loading....');
  //               FocusScope.of(context).unfocus();
  //               await controller.changeVideo(
  //                 playVideoFrom: PlayVideoFrom.youtube(videoTextFieldCtr.text),
  //               );
  //               if (!mounted) return;
  //               ScaffoldMessenger.of(context).hideCurrentSnackBar();
  //             } catch (e) {
  //               snackBar('Unable to load,\n $e');
  //             }
  //           },
  //           child: const Text('Load Video'),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  void snackBar(String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(text),
        ),
      );
  }
}


// PodVideoPlayer(
            //   frameAspectRatio: MediaQuery.of(context).size.width / MediaQuery.of(context).size.height,
            //   videoAspectRatio: 9 / 16,
            //   controller: controller,
            //   hideControls: true,
            //   alwaysShowProgressBar: false,
            //   videoThumbnail: const DecorationImage(
            //     image: NetworkImage(
            //       'https://images.unsplash.com/photo-1569317002804-ab77bcf1bce4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dW5zcGxhc2h8ZW58MHx8MHx8&w=1000&q=80',
            //     ),
            //     fit: BoxFit.cover,
            //   ),
            // ),