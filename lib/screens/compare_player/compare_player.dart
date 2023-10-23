import 'package:anni_ai/screens/compare_player/compare_player_vm.dart';
import 'package:anni_ai/screens/player_data/graph/graph_vm.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/color.dart';
import '../../utils/common_widget.dart';
import '../../utils/player_images.dart';
import '../betting_detail/players_model.dart';

class ComparePlayer extends StatefulWidget {
  GraphVm vm;
  String playerId;

  ComparePlayer({Key? key, required this.vm, required this.playerId})
      : super(key: key);

  @override
  State<ComparePlayer> createState() => _ComparePlayerState();
}

class _ComparePlayerState extends State<ComparePlayer> {
  var vm = ComparePlayerVm();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    void filterSearch(String query) {
      List<PlayerImages> dummySearchList = [];
      dummySearchList.addAll(vm.allPlayersDuplicate);
      if (query.isNotEmpty) {
        List<PlayerImages> dummyListData = [];
        dummySearchList.forEach((item) {
          if (item.name!.contains(query.trim()) ||
              item.name!.toLowerCase().contains(query.trim())) {
            dummyListData.add(item);
          }
        });
        vm.allPlayers.clear();
        vm.allPlayers.addAll(dummyListData);

        setState(() {

        });
        return;
      } else {
        vm.allPlayers.clear();
        vm.allPlayers.addAll(vm.allPlayersDuplicate);
        setState(() {

        });
      }
    }

    return Scaffold(
      backgroundColor: AppColor.black,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.backColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            padding:
                const EdgeInsets.only(top: 50, bottom: 20, right: 20, left: 20),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: BoldText("Compare a Player", 14,
                          AppColor.whiteColor, TextAlign.center),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColor.greenColor,
                        )),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColor.liteGrayColor,
                      borderRadius: BorderRadius.circular(30)),
                  margin: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: AppColor.whiteColor),
                    onChanged: (text) {
                      filterSearch(text);
                    },
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.search,
                          color: AppColor.greenColor,
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        hintText: "Search a player..",
                        hintStyle: TextStyle(color: AppColor.hintColor)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: (vm.isLoading == true)
                ? Progress()
                : ListView.builder(
                    itemCount: vm.allPlayers.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          widget.vm.isLoading = true;
                          setState(() {
                            vm.click = index;
                          });
                          widget.vm.comparePlayerName =
                              await vm.allPlayers[index].name.toString();
                          Navigator.pop(context,
                              vm.allPlayers[index].playerID.toString());
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: 20, left: 20, top: 10),
                          color: (vm.click == index)
                              ? AppColor.liteGrayColor
                              : AppColor.black,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            color: AppColor.hintColor,
                                            width: 0.5)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: CachedNetworkImage(
                                        height: 40,
                                        width: 40,
                                        imageUrl: vm.allPlayers[index].hostedHeadshotNoBackgroundUrl.toString(),
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
                                      ),

                                     /* Image.network(
                                        vm.allPlayers[index].photoUrl
                                            .toString(),
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null)
                                            return child;
                                          return SizedBox(
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
                                          );
                                        },
                                      ),*/
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.bottomCenter,
                                      width: 46,
                                      margin: const EdgeInsets.only(top: 37),
                                      child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: SvgPicture.network(vm
                                              .allPlayers[index].teamImg
                                              .toString()))),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              BoldText(vm.allPlayers[index].name.toString(), 15,
                                  AppColor.whiteColor, TextAlign.start)
                            ],
                          ),
                        ),
                      );
                    }),
          )
        ],
      ),
    );
  }

  Future<void> getData() async {
    await vm.getPlayers(context, widget.playerId);
    setState(() {});
  }
}
