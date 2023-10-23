import 'dart:convert';

import 'package:anni_ai/apis/api_controller.dart';
import 'package:anni_ai/screens/player_data/roster/roster_model.dart';
import 'package:anni_ai/utils/all_keys.dart';
import 'package:anni_ai/utils/common.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/color.dart';
import '../../../utils/common_widget.dart';

class Roster extends StatefulWidget {
  String teamId, position;

  Roster({Key? key, required this.teamId, required this.position})
      : super(key: key);

  @override
  State<Roster> createState() => _RosterState();
}

class _RosterState extends State<Roster> {

  RostedData rostedData = RostedData();
  var isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading == true)
        ? Progress()
        :(rostedData.body!.isEmpty)?NoData("No Data", "", context):CustomScrollView(
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
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColor.hintColor,width: 0.5)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: CachedNetworkImage(
                              height: 40,
                              width: 40,
                              imageUrl: rostedData.body![index].playerImg.toString(),
                              errorWidget: (context, url, error) => Image.asset("assets/images/football_player.png"),
                              progressIndicatorBuilder: (context, url, downloadProgress) =>
                                  SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Shimmer.fromColors(
                                      baseColor:
                                      AppColor.fieldBackColor,
                                      highlightColor:
                                      AppColor.liteGrayColor,
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                            )
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          width: 46,
                          margin: const EdgeInsets.only(top: 35),
                          child: SizedBox(
                              height: 25, width: 25,
                              child: SvgPicture.network(
                                rostedData.body![index].teamImg.toString(),)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5,),
                        BoldText(rostedData.body![index].name.toString(), 16,
                            AppColor.whiteColor,
                            TextAlign.start),
                        const SizedBox(
                          height: 3,
                        ),
                        CommonText((rostedData.body![index].depthOrder.toString() == "1")?"STARTER":getOrdinal(int.parse(
                            rostedData.body![index].depthOrder.toString())), 16,
                            AppColor.textGreenColor,
                            TextAlign.start),
                      ],
                    )
                  ],
                ),
              );
            },
            childCount: rostedData.body!.length,
          ),
        ),
      ],
    );
  }

  Future<bool> getData() async {
    String res = await getMethodWithQuery("GET",
        "${AllKeys.depthChart}?teamID=${widget.teamId}&position=${widget
            .position}", null, context);

    var response = jsonDecode(res);

    rostedData = RostedData.fromJson(response);

    if (rostedData.code == 200) {
      for (var i = 0; i < rostedData.body!.length; i++) {
        for (var j = 0; j < allTeams.length; j++) {
          if (rostedData.body![i].teamID.toString() ==
              allTeams[j].teamID.toString()) {
            rostedData.body![i].teamImg =
                allTeams[j].wikipediaLogoUrl.toString();
          }
        }

        for (var j = 0; j < allPlayers.length; j++) {
          if (rostedData.body![i].playerID.toString() == allPlayers[j].playerID.toString()) {
            rostedData.body![i].playerImg = allPlayers[j].hostedHeadshotNoBackgroundUrl.toString();
          }
        }
      }

      setState(() {
        isLoading = false;
      });

      return true;
    }
    else {
      setState(() {
        isLoading = false;
      });
      return true;
    }
  }
}




