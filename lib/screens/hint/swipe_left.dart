import 'package:anni_ai/dialogs/swipe_right_dialog.dart';
import 'package:flutter/material.dart';

import '../../dialogs/swipe_left_dialog.dart';
import '../../utils/color.dart';

class SwipeLeft extends StatefulWidget {
  const SwipeLeft({Key? key}) : super(key: key);

  @override
  State<SwipeLeft> createState() => _SwipeLeftState();
}

class _SwipeLeftState extends State<SwipeLeft> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
          barrierDismissible: false,
          barrierColor: AppColor.dialogBackgroundColor,
          context: context, builder: (context)=> const SwipeLeftDialog());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/right_menu_img.png"), fit: BoxFit.fill),
      ),
    );
  }
}
