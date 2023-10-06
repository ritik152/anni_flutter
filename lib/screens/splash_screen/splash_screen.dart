import 'dart:async';

import 'package:anni_ai/screens/chat/chat.dart';
import 'package:anni_ai/screens/splash_screen/splash_vm.dart';
import 'package:anni_ai/screens/start_screen/start_screen.dart';
import 'package:anni_ai/utils/all_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  late VideoPlayerController controller;
  var vm = SplashVm();

  @override
  void initState() {
    super.initState();

    vm.currentSeason(context);
    vm.currentWeek(context);
    controller = VideoPlayerController.asset('assets/video/splash.mp4');

    controller.initialize().then((value){
      setState(() {


      });


    });

    Timer(const Duration(seconds: 3), () {
      setState(() {
        controller.play();
      });
    });

    Timer(const Duration(seconds: 5), () {
      nextScreen();
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 50),
            child: Image.asset("assets/images/ball.png"),
            // child: VideoPlayer(controller),
          ),
        ),
      ),
    );

  }

  Future<void> nextScreen() async {
    SharedPreferences prf = await SharedPreferences.getInstance();

    if(prf.get(AllKeys.authorization).toString() == "null"){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const StartScreen()), (route) => false);
    }else{
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Chat()), (route) => false);
    }

  }
}
