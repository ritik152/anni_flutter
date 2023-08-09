import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'color.dart';

Widget NoData(String text,String image, BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height*0.70,
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image,height: 200,width: 200,),
          const SizedBox(height: 10,),
          BoldText(text, 17, AppColor.whiteColor, TextAlign.center),
        ],
      ),
    ),
  );
}

Widget CommonText(String s, double size, Color color, TextAlign align) {
  return Text(s, textAlign: align,
    style: TextStyle(
        fontSize: size,
        fontFamily: "Reg",
        color: color),
  );
}

Widget CommonTextOverFlowed(String s, double size, Color color, TextAlign align) {
  return Text(s, textAlign: align,
    overflow: TextOverflow.ellipsis,
    maxLines: 4,
    style: TextStyle(
        fontSize: size,
        fontFamily: "Reg",
        color: color),
  );
}

Widget BoldText(String s, double size,Color color, TextAlign align) {
  return Text(s, textAlign: align,
    style: TextStyle(
        fontSize: size,
        fontFamily: "Bold",
        color: color),
  );
}

Widget BoldItalicText(String s, double size,Color color, TextAlign align) {
  return Text(s, textAlign: align,
    style: TextStyle(
        fontSize: size,
        fontFamily: "Bold_It",
        color: color),
  );
}

Widget MediumText(String s, double size,Color color, TextAlign align) {
  return Text(s, textAlign: align,
    style: TextStyle(
        fontSize: size,
        fontFamily: "Med",
        color: color),
  );
}

Widget Progress() {
  return Center(child: Platform.isAndroid?CircularProgressIndicator(
    color: AppColor.yellowColor,
  ):const CupertinoActivityIndicator());
}

Widget NoInternet(BuildContext context) {
  return Scaffold(
    backgroundColor: AppColor.whiteColor,
    body: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/no_internet.png",height: 100,width: 100,),
            const SizedBox(height: 20,),
            BoldText("No Connection", 22, AppColor.lightBlue,TextAlign.start),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: CommonText("No internet connection found. Please check your internet connection and try again", 15, AppColor.black, TextAlign.center),
            )
          ],
        ),
      ),
    ),
  );
}