import 'package:anni_ai/dialogs/swipe_right_dialog.dart';
import 'package:flutter/material.dart';

import '../../dialogs/swipe_left_dialog.dart';
import '../../utils/color.dart';

class SwipeRight extends StatefulWidget {
  const SwipeRight({Key? key}) : super(key: key);

  @override
  State<SwipeRight> createState() => _SwipeRightState();
}

class _SwipeRightState extends State<SwipeRight> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
        barrierDismissible: false,
          barrierColor: AppColor.dialogBackgroundColor,
          context: context, builder: (context)=> const SwipeRightDialog());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/left_menu_img.png"), fit: BoxFit.fill),
      ),
    );
  }
}
