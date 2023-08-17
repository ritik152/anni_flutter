import 'package:anni_ai/apis/api_controller.dart';
import 'package:anni_ai/screens/account_settings/change_pass_vm.dart';
import 'package:flutter/material.dart';
import '../../utils/buttons.dart';
import '../../utils/color.dart';
import '../../utils/common.dart';
import '../../utils/common_widget.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {

  var vm = ChangePasswordVM();

  @override
  void initState() {
    super.initState();

    vm.userName.text = registerModel.body!.name.toString();

    setState(() {

    });

  }

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
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)
                  )
              ),

              padding: const EdgeInsets.only(
                  top: 35,
                  bottom: 20,
                  right: 20,
                  left: 20),

              child: Stack(
                children: [

                  SizedBox(
                    width: double.infinity,
                    child: BoldText("Account Settings", 14, AppColor.whiteColor, TextAlign.center),
                  ),
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context,true);
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

                    GestureDetector(
                      onTap: (){
                        if(vm.click == 0){
                          vm.click = -1;
                          setState(() {

                          });
                        }
                        else{
                          vm.click = 0;
                          setState(() {

                          });
                        }

                      },
                      child: Container(
                        color: AppColor.liteGrayColor,
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MediumText("Basic Information", 12, AppColor.whiteColor, TextAlign.start),
                            (vm.click == 0)?
                            Image.asset("assets/icons/up_arrow.png",height: 12,width: 12,color: AppColor.greenColor,):
                            Image.asset("assets/icons/down_arrow.png",height: 12,width: 12,color: AppColor.greenColor,)
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 5,),

                    if(vm.click == 0)Column(
                      children: [
                        const SizedBox(height: 30,),

                        //--------------------------------------User Name--------------------------------

                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColor.fieldBack,
                              borderRadius: BorderRadius.circular(30)),
                          margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                          child: TextFormField(
                            textCapitalization: TextCapitalization.words,
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.text,
                            controller: vm.userName,
                            style: TextStyle(color: AppColor.whiteColor),
                            decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      vm.showHideClick(context);
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(14),
                                    child: Image.asset("assets/icons/user.png",height: 15,width: 15,),
                                  ),
                                ),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                hintText: registerModel.body!.name.toString(),
                                hintStyle: TextStyle(color: AppColor.hintColor)),
                          ),
                        ),

                        //-------------------------------------Reset User Name----------------------------

                        Container(
                          width: double.infinity,
                          height: 50,
                          margin: const EdgeInsets.only(right: 20,left: 20,bottom: 20,top: 30),
                          child: RoundedButton(text: "Change Name", color: AppColor.black, buttonColor: AppColor.textGreenColor, radios: 50,
                              onTap: (){
                                if(vm.nameValidation()){
                                  hideKeyboard();
                                  vm.changeName(context);
                                }
                              }),
                        )
                      ],
                    ),

                    const SizedBox(height: 5,),

                    GestureDetector(
                      onTap: (){

                        if(vm.click == 1){
                          vm.click = -1;
                          setState(() {

                          });
                        }
                        else{
                          vm.click = 1;
                          setState(() {

                          });
                        }

                      },
                      child: Container(
                        color: AppColor.liteGrayColor,
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MediumText("Change Password", 12, AppColor.whiteColor, TextAlign.start),
                            (vm.click == 1)?Image.asset("assets/icons/up_arrow.png",height: 12,width: 12,color: AppColor.greenColor,):
                            Image.asset("assets/icons/down_arrow.png",height: 12,width: 12,color: AppColor.greenColor,)
                          ],
                        ),
                      ),
                    ),

                    if(vm.click == 1)Column(
                      children: [
                        const SizedBox(height: 30,),
                        //--------------------------------------Current Password--------------------------------
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColor.fieldBack,
                              borderRadius: BorderRadius.circular(30)),
                          margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                          child: TextFormField(
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.text,
                            obscureText: vm.obscureOld,
                            controller: vm.oldPassword,
                            style: TextStyle(color: AppColor.whiteColor),
                            decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      vm.showHideClick(context);
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
                                hintText: "Current Password..",
                                hintStyle: TextStyle(color: AppColor.hintColor)),
                          ),
                        ),


                        //--------------------------------------New Password--------------------------------
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColor.fieldBack,
                              borderRadius: BorderRadius.circular(30)),
                          margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                          child: TextFormField(
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.text,
                            obscureText: vm.obscureNew,
                            controller: vm.newPassword,
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
                                hintText: "New Password..",
                                hintStyle: TextStyle(color: AppColor.hintColor)),
                          ),
                        ),

                        //--------------------------------------Repeat Password--------------------------------
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColor.fieldBack,
                              borderRadius: BorderRadius.circular(30)),
                          margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                          child: TextFormField(
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.text,
                            obscureText: vm.obscureConfirm,
                            controller: vm.confirmPassword,
                            style: TextStyle(color: AppColor.whiteColor),
                            decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      vm.showHideConfirmClick(context);
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
                                hintText: "Repeat Password..",
                                hintStyle: TextStyle(color: AppColor.hintColor)),
                          ),
                        ),

                        //-------------------------------------Reset Password Button----------------------------

                        Container(
                          width: double.infinity,
                          height: 50,
                          margin: const EdgeInsets.only(right: 20,left: 20,bottom: 50,top: 30),
                          child: RoundedButton(text: "Reset Password", color: AppColor.black, buttonColor: AppColor.textGreenColor, radios: 50,
                              onTap: (){
                                if(vm.validation()){
                                  vm.changePassword(context);
                                }
                              }),
                        )
                      ],
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
