import 'dart:io';

import 'package:anni_ai/screens/chat/chat.dart';
import 'package:anni_ai/screens/forgot_password/forgot_password.dart';
import 'package:anni_ai/screens/hint/swipe_left.dart';
import 'package:anni_ai/screens/login/login_vm.dart';
import 'package:anni_ai/screens/signup/signup.dart';
import 'package:anni_ai/utils/common.dart';
import 'package:flutter/material.dart';

import '../../utils/buttons.dart';
import '../../utils/color.dart';
import '../../utils/common_widget.dart';
import '../hint/swipe_right.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var vm = LoginVm();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: (){
          hideKeyboard();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.only(top: 70),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: AppColor.backColorNew,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20) )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50,),
                Image.asset("assets/images/ball.png",height: 50,width: 100,),
                const SizedBox(height: 20,),
                BoldText("Log In", 20, AppColor.whiteColor, TextAlign.center),
                const SizedBox(height: 30,),

                //--------------------------------------Email--------------------------------
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColor.fieldBack,
                      borderRadius: BorderRadius.circular(30)),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller: vm.email,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: AppColor.whiteColor),
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Image.asset("assets/icons/email.png",height: 15,width: 15,),
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        hintText: "Email..",
                        hintStyle: TextStyle(color: AppColor.hintColor)),
                  ),
                ),

                //--------------------------------------Password--------------------------------
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColor.fieldBack,
                      borderRadius: BorderRadius.circular(30)),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    obscureText: vm.obscureNew,
                    controller: vm.password,
                    style: TextStyle(color: AppColor.whiteColor),
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: (){

                            setState(() {
                              vm.showHideNewClick(context);
                            });

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Image.asset("assets/icons/lock.png",height: 15,width: 15,),
                          ),
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        hintText: "Password..",
                        hintStyle: TextStyle(color: AppColor.hintColor)),
                  ),
                ),

                //--------------------------------------Forgot Password--------------------------

                const SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgotPassword()));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 10),
                    width: double.infinity,
                    child: BoldItalicText("Forgot Password?", 13, AppColor.textGreenColor, TextAlign.end),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColor.backColorNew,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 35),
              child: RoundedButton(text: "Log In", color: AppColor.black, buttonColor: AppColor.textGreenColor, radios: 50,
                  onTap: (){
                var deviceType = "1";
                    if(Platform.isIOS){
                      deviceType = "2";
                    }
                    if(vm.validation()){

                      Map<String,String> map = {
                        "email":vm.email.text.toString().trim(),
                        "password":vm.password.text.toString().trim(),
                        "device_type":deviceType,
                        "device_token":"qwe",
                      };
                      vm.loginApi(map,context);
                    }
                  }),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const SignUp()), (route) => false);
              },
              child: RichText(text: TextSpan(
                  text: 'or ',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Reg",
                      color: AppColor.greenColor),
                  children: [
                    TextSpan(
                      text: 'Create an Account ',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Bold",
                          color: AppColor.greenColor),),
                    TextSpan(
                      text: 'to ',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Reg",
                          color: AppColor.greenColor),),
                    TextSpan(
                      text: 'Get Started',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Bold",
                          color: AppColor.greenColor),),
                  ])),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
