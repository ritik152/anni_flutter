import 'package:anni_ai/screens/compare_player/compare_player_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/color.dart';
import '../../utils/common_widget.dart';
import '../betting_detail/players_model.dart';

class ComparePlayer extends StatefulWidget {
  const ComparePlayer({Key? key}) : super(key: key);

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
      List<PlayersModel> dummySearchList = [];
      dummySearchList.addAll(vm.allPlayers);
      if(query.isNotEmpty) {
        List<PlayersModel> dummyListData = [];
        dummySearchList.forEach((item) {
          if(item.name!.contains(query) || item.name!.toLowerCase().contains(query)) {
            dummyListData.add(item);
          }
        });
        setState(() {
          vm.allPlayers.clear();
          vm.allPlayers.addAll(dummyListData);
        });
        return;
      } else {
        setState(() {
          vm.allPlayers.clear();
          vm.allPlayers.addAll(vm.allPlayersDuplicate);
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
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
            ),
            padding: const EdgeInsets.only(top: 50,bottom: 20,right: 20,left: 20),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: BoldText("Compare a Player", 14, AppColor.whiteColor, TextAlign.center),
                    ),
                    GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios,color: AppColor.greenColor,)),
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
                    onChanged: (text){
                      filterSearch(text);
                    },
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search,color: AppColor.greenColor,),
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
                ?Progress()
                :ListView.builder(
              itemCount: vm.allPlayers.length,
                itemBuilder: (context,index){
              return Container(
                margin: const EdgeInsets.only(right: 20, left: 20, top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            vm.allPlayers[index].photoUrl.toString(),
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 30, left: 10),
                            child: SizedBox(
                              height: 20,width: 20,
                                child: SvgPicture.network(vm.allPlayers[index].teamImg.toString()))),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    BoldText(vm.allPlayers[index].name.toString(), 15, AppColor.whiteColor, TextAlign.start)
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  Future<void> getData() async {
    await vm.getPlayers(context);
    setState(() {

    });
  }
}
