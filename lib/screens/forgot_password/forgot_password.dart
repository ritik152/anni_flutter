import 'package:anni_ai/screens/forgot_password/forgot_password_vm.dart';
import 'package:flutter/material.dart';

import '../../dialogs/forgot_pass_success_dialog.dart';
import '../../utils/buttons.dart';
import '../../utils/color.dart';
import '../../utils/common.dart';
import '../../utils/common_widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var vm = ForgotPasswordVm();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios,color: AppColor.greenColor,)),
        elevation: 0.0,
      ),
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
                BoldText("Forgot Password?", 21, AppColor.whiteColor, TextAlign.center),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: MediumText("Enter the email you signed up\nwith and we'll send a reset link.", 13, AppColor.whiteColor, TextAlign.center),
                ),
                const SizedBox(height: 30,),

                //--------------------------------------Email---------------------------
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColor.liteGrayColor,
                      borderRadius: BorderRadius.circular(30)),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller: vm.email,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.visiblePassword,
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

                //--------------------------------------Resend--------------------------

                const SizedBox(height: 10,),
                if(vm.hideButton == true)GestureDetector(
                  onTap: () async {
                    Map<String,String> map = {
                      "email":vm.email.text.toString().trim(),
                    };
                    var data = await vm.forgotPasswordApi(map,context);
                    if(data == true){
                      setState(() {
                        vm.hideButton = true;
                        showDialog(context: context, builder: (context)=> const ForgotPassSuccess());
                      });
                    }
                  },
                  child: RichText(text: TextSpan(
                      text: "Didn't receive an email? ",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Reg",
                          color: AppColor.greenColor),
                      children: [
                        TextSpan(
                          text: 'Resend',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Bold",
                              color: AppColor.greenColor),),
                      ])),
                ),
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
            if(vm.hideButton == false)Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 35),
              child: RoundedButton(text: "Send Link", color: AppColor.black, buttonColor: AppColor.textGreenColor, radios: 50,
                  onTap: () async {

                    if(vm.validation()){

                      Map<String,String> map = {
                        "email":vm.email.text.toString().trim(),
                      };

                      var data = await vm.forgotPasswordApi(map,context);

                      if(data == true){
                        setState(() {
                          vm.hideButton = true;
                          showDialog(context: context, builder: (context)=> const ForgotPassSuccess());
                        });
                      }
                    }

                  }),
            ),
            const SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
