import 'package:flutter/material.dart';

import '../../../utils/color.dart';
import '../../../utils/common_widget.dart';

class Roster extends StatelessWidget {
  const Roster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Container(
                height: 80,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(right: 30, left: 30, top: 10),
                decoration: BoxDecoration(
                  color: AppColor.backTrendingColor,
                  borderRadius: BorderRadius.circular(22),
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            "assets/images/doctor_img.jpg",
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 30, left: 10),
                            child: Image.asset(
                              "assets/images/star.png",
                              height: 25,
                              width: 25,
                            )),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5,),
                        BoldText("Malik Davis", 16, AppColor.whiteColor,
                            TextAlign.start),
                        const SizedBox(
                          height: 3,
                        ),
                        CommonText("STARTER", 16, AppColor.textGreenColor,
                            TextAlign.start),
                      ],
                    )
                  ],
                ),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }
}