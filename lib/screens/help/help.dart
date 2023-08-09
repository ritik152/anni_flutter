import 'package:anni_ai/screens/help/help_vm.dart';
import 'package:anni_ai/utils/common.dart';
import 'package:flutter/material.dart';

import '../../dialogs/help_success/HelpSuccessDialog.dart';
import '../../utils/buttons.dart';
import '../../utils/color.dart';
import '../../utils/common_widget.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {

  var vm = HelpVm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: GestureDetector(
        onTap: (){
          hideKeyboard();
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColor.backColor,
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
              ),
              padding: const EdgeInsets.only(top: 35,bottom: 20,right: 20,left: 20),
              child: Stack(
                children: [

                  SizedBox(
                    width: double.infinity,
                    child: BoldText("Help", 14, AppColor.whiteColor, TextAlign.center),
                  ),
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios,color: AppColor.greenColor,)),
                ],
              ),
            ),

            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30,),

                    //--------------------------------------Email--------------------------------
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColor.fieldBack,
                          borderRadius: BorderRadius.circular(30)),
                      margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
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
                            hintText: "Your email..",
                            hintStyle: TextStyle(color: AppColor.hintColor)),
                      ),
                    ),


                    //--------------------------------------Subject--------------------------------
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColor.fieldBack,
                          borderRadius: BorderRadius.circular(30)),
                      margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                      child: TextFormField(
                        controller: vm.subject,
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: AppColor.whiteColor),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            hintText: "Subject..",
                            hintStyle: TextStyle(color: AppColor.hintColor)),
                      ),
                    ),

                    //--------------------------------------Description--------------------------------
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColor.fieldBack,
                          borderRadius: BorderRadius.circular(30)),
                      margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        controller: vm.message,
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: AppColor.whiteColor),
                        maxLength: 350,
                        maxLines: 9,
                        decoration: InputDecoration(
                            counterStyle: TextStyle(color: AppColor.greenColor),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            hintText: "Type your message..",
                            hintStyle: TextStyle(color: AppColor.hintColor)),
                      ),
                    ),


                    const SizedBox(height: 70,),

                    Image.asset("assets/images/ball.png",height: 50,),
                    //--------------------------------------Button--------------------------------
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.only(right: 20,left: 20,bottom: 30,top: 70),
                      child: RoundedButton(text: "Submit", color: AppColor.black, buttonColor: AppColor.textGreenColor, radios: 50,
                          onTap: (){
                            if(vm.validation()){
                              Map<String,String> map = {
                                "email":vm.email.text.toString().trim(),
                                "subject":vm.subject.text.toString().trim(),
                                "message":vm.message.text.toString().trim(),
                              };

                              vm.helpApi(map, context);
                            }
                          }),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
