import 'dart:io';
import 'package:anni_ai/apis/api_controller.dart';
import 'package:anni_ai/screens/chat/chat.dart';
import 'package:anni_ai/screens/profile/profile_vm.dart';
import 'package:anni_ai/utils/all_keys.dart';
import 'package:anni_ai/utils/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../dialogs/delete_account_dialog.dart';
import '../../dialogs/logout/logout_dialog.dart';
import '../../utils/color.dart';
import '../account_settings/account_settings.dart';
import '../help/help.dart';
import '../subscription/subscription.dart';

class ProfileScreen extends StatefulWidget {

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

}

class _ProfileScreenState extends State<ProfileScreen> {

  var vm = ProfileVm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Column(
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
                  child: BoldText("Profile", 14, AppColor.whiteColor, TextAlign.center),
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
                  Container(
                    margin: const EdgeInsets.only(top: 70),
                    height: 120,
                    width: 120,
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: AppColor.hintColor)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: (registerModel.body!.image.toString() == "null")?Image.asset("assets/images/user.png",height: 100,width: 100,fit: BoxFit.cover,):Image.network(AllKeys.imageUrl+registerModel.body!.image.toString(),height: 100,width: 100,fit: BoxFit.cover,),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            openImageSelectionDialog(context);
                          },
                          child: Container(
                            alignment: Alignment.topRight,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: AppColor.backColor,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Image.asset("assets/icons/pen.png",height: 18,width: 18,color: AppColor.greenColor,)),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  BoldText(registerModel.body!.name.toString(), 17, AppColor.whiteColor, TextAlign.center),

                  const SizedBox(height: 20,),

                  //-------------------------------------------------Account Settings-------------------------
                  GestureDetector(
                    onTap: () async {
                      var data = await Navigator.push(context, MaterialPageRoute(builder: (context)=> const AccountSettings()));
                        setState(() {

                        });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.liteGrayColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      margin:
                      const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      padding: const EdgeInsets.symmetric(vertical: 17,horizontal: 20),
                      child: Row(
                        children: [
                          Image.asset("assets/icons/settings.png",height: 20,width: 20,color: AppColor.greenColor,),
                          const SizedBox(width: 10,),
                          BoldText("Account Settings", 14, AppColor.whiteColor, TextAlign.start)
                        ],
                      ),
                    ),
                  ),

                  //-------------------------------------------------Subscription-------------------------
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Subscription()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.liteGrayColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      margin:
                      const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      padding: const EdgeInsets.symmetric(vertical: 17,horizontal: 20),
                      child: Row(
                        children: [
                          Image.asset("assets/icons/subscription.png",height: 20,width: 20,color: AppColor.greenColor,),
                          const SizedBox(width: 10,),
                          BoldText("Subscription", 14, AppColor.whiteColor, TextAlign.start)
                        ],
                      ),
                    ),
                  ),

                  //-------------------------------------------------Help-------------------------
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Help()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.liteGrayColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      margin:
                      const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      padding: const EdgeInsets.symmetric(vertical: 17,horizontal: 20),
                      child: Row(
                        children: [
                          Image.asset("assets/icons/help.png",height: 20,width: 20,color: AppColor.greenColor,),
                          const SizedBox(width: 10,),
                          BoldText("Help", 14, AppColor.whiteColor, TextAlign.start)
                        ],
                      ),
                    ),
                  ),

                  //-------------------------------------------------Legal-------------------------
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.liteGrayColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    margin:
                    const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    padding: const EdgeInsets.symmetric(vertical: 17,horizontal: 20),
                    child: Row(
                      children: [
                        Image.asset("assets/icons/legal.png",height: 20,width: 20,color: AppColor.greenColor,),
                        const SizedBox(width: 10,),
                        BoldText("Legal", 14, AppColor.whiteColor, TextAlign.start)
                      ],
                    ),
                  ),

                  //-------------------------------------------------Log Out-------------------------
                  GestureDetector(
                    onTap: (){
                      showDialog(
                          barrierColor: AppColor.dialogBackgroundColor,
                          context: context, builder: (context)=> const LogoutConfirmation());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.liteGrayColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      margin:
                      const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      padding: const EdgeInsets.symmetric(vertical: 17,horizontal: 20),
                      child: Row(
                        children: [
                          Image.asset("assets/icons/logout_icon.png",height: 20,width: 20,color: AppColor.greenColor,),
                          const SizedBox(width: 10,),
                          BoldText("Log Out", 14, AppColor.whiteColor, TextAlign.start)
                        ],
                      ),
                    ),
                  ),

                  //-------------------------------------------------Delete Account-------------------------
                  GestureDetector(

                    onTap: (){
                      showDialog(
                          barrierColor: AppColor.dialogBackgroundColor,
                          context: context, builder: (context)=> const DeleteAccountDialog());
                    },

                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.liteGrayColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      margin:
                      const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      padding: const EdgeInsets.symmetric(vertical: 17,horizontal: 20),
                      child: Row(
                        children: [
                          Image.asset("assets/icons/delete.png",height: 20,width: 20,color: AppColor.greenColor,),
                          const SizedBox(width: 10,),
                          BoldText("Delete Account", 14, AppColor.whiteColor, TextAlign.start)
                        ],
                      ),
                    ),

                  ),

                  const SizedBox(height: 80,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/ball.png",height: 50,),
                            const SizedBox(height: 10,),
                            CommonText("2023 AI Fantasy Guys", 11, AppColor.whiteColor, TextAlign.start),
                            CommonText("All Rights Reserved", 11, AppColor.whiteColor, TextAlign.start),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset("assets/images/instagram.png",height: 30,width: 30,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset("assets/images/twitter.png",height: 30,width: 30,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset("assets/images/browser.png",height: 30,width: 30,color: AppColor.greenColor,),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 20,),
                ],
              ),
            ),
          )
        ],
      ),


    );

  }

  openImageSelectionDialog(BuildContext context) {
    return showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: const BoxDecoration(
              color: Color(0xff212529),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  offset: Offset(0, 2),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    pickImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Image.asset("assets/icons/camera.png",
                            height: 25, width: 25, color: Color(0xff147efb)),
                        SizedBox(
                          width: 20,
                        ),
                        BoldText(
                            "Camera", 15, AppColor.whiteColor, TextAlign.start)
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 0.7,
                  width: MediaQuery.of(context).size.width,
                  color: AppColor.hintColor,
                ),
                InkWell(
                  onTap: () {
                    pickImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/icons/gallery.png",
                          height: 25,
                          width: 25,
                          color: const Color(0xff147efb),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        BoldText(
                            "Gallery", 15, AppColor.whiteColor, TextAlign.start)
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 0.7,
                  width: MediaQuery.of(context).size.width,
                  color: AppColor.hintColor,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        SizedBox(
                            width: 70,
                            child: BoldText("Cancel", 15,
                                const Color(0xff147efb), TextAlign.start))

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemp = File(image.path);

      vm.imageList = imageTemp;


      vm.imageParams = {'image$key_splite': vm.imageList!.path};
      Map<String,String> map = {
        "type":"1"
      };

      var data = await vm.updateProfilePicture(context, map,vm.imageParams);
      if(data == true){
        var profileData = await vm.getProfile(context);
        if(profileData == true){
          setState(() {});
        }
      }
      print("Imageee-" + imageTemp.toString());
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

}
