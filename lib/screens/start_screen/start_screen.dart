import 'package:anni_ai/screens/login/login.dart';
import 'package:anni_ai/utils/buttons.dart';
import 'package:anni_ai/utils/color.dart';
import 'package:anni_ai/utils/common_widget.dart';
import 'package:flutter/material.dart';

import '../signup/signup.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/ai_image.png",width: double.infinity,height: MediaQuery.of(context).size.height*0.40,fit: BoxFit.cover,),
          const SizedBox(height: 20,),
          Image.asset("assets/images/ball.png",height: 50,width: 100,),
           Padding(padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
           child: CommonText("Our AI-powered Fantasy Football assistant. Your personalized NFL insider delivering data-driven insights and analytics to help dominate your league.", 15, AppColor.whiteColor, TextAlign.center),)
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 35),
            child: RoundedButton(text: "Get Started", color: AppColor.black, buttonColor: AppColor.greenColor, radios: 50,
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUp()));
                }),
          ),
          const SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const Login()));
            },
            child: RichText(text: TextSpan(
                text: 'or ',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Reg",
                    color: AppColor.greenColor),
                children: [
                  TextSpan(
                      text: 'Log In ',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Bold",
                          color: AppColor.greenColor),),
                  TextSpan(
                      text: 'to an Existing Account',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Reg",
                          color: AppColor.greenColor),),
            ])),
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}
