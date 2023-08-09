import 'package:anni_ai/utils/common_widget.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';
import 'chat_vm.dart';

class SenderTextView extends StatefulWidget {

  LocalChatData chatData;
  SenderTextView({Key? key,required this.chatData,required this.email}) : super(key: key);
  String email = '';
  @override
  State<SenderTextView> createState() => _SenderTextViewState();

}

class _SenderTextViewState extends State<SenderTextView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: const EdgeInsets.only(left: 20.0,top: 5,right: 20.0,bottom: 3),
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.hintColor,),
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
        ),
        child: CommonText(widget.chatData.humanMesasge.replaceFirst('\n', '',1), 14, AppColor.whiteColor, TextAlign.start),
      ),
    );
  }

}
