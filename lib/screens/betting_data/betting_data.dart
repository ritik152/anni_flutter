import 'dart:convert';
import 'package:anni_ai/apis/api_controller.dart';
import 'package:anni_ai/screens/betting_data/betting_data_vm.dart';
import 'package:anni_ai/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/all_keys.dart';
import '../../utils/color.dart';
import '../../utils/common_widget.dart';
import '../betting_detail/betting_detail.dart';
import 'all_teams_model.dart';
import 'betting_data_model.dart';

class BeatingData extends StatefulWidget {
  const BeatingData({Key? key}) : super(key: key);

  @override
  State<BeatingData> createState() => _BeatingDataState();
}

class _BeatingDataState extends State<BeatingData> {

  var vm = BettingDataVm();

  @override
  void initState() {
    super.initState();

    getData();

  }


  @override
  Widget build(BuildContext context) {
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
              child: Stack(
                children: [

                  SizedBox(
                    width: double.infinity,
                    child: BoldText("Betting Data", 14, AppColor.whiteColor,
                        TextAlign.center),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios, color: AppColor.greenColor,)),
                ],
              )
          ),
          const SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100,
                  height: 50,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: AppColor.black,
                          //background color of dropdown button
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: AppColor.hintColor),
                          boxShadow: const <BoxShadow>[
                            //apply shadow on Dropdown button
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.57),
                                //shadow for button
                                blurRadius: 5)
                            //blur radius of shadow
                          ]
                      ),

                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: DropdownButton(
                            value: vm.value,
                            items: const [ //add items in the dropdown
                              DropdownMenuItem(
                                value: "1",
                                child: Text("Week 1"),
                              ),
                              DropdownMenuItem(
                                  value: "2",
                                  child: Text("Week 2")
                              ),
                              DropdownMenuItem(
                                value: "3",
                                child: Text("Week 3"),
                              ),
                              DropdownMenuItem(
                                value: "4",
                                child: Text("Week 4"),
                              ),
                              DropdownMenuItem(
                                value: "5",
                                child: Text("Week 5"),
                              ),
                              DropdownMenuItem(
                                value: "6",
                                child: Text("Week 6"),
                              ),
                              DropdownMenuItem(
                                value: "7",
                                child: Text("Week 7"),
                              ),
                              DropdownMenuItem(
                                value: "8",
                                child: Text("Week 8"),
                              ),
                              DropdownMenuItem(
                                value: "9",
                                child: Text("Week 9"),
                              ),
                              DropdownMenuItem(
                                value: "10",
                                child: Text("Week 10"),
                              ),
                              DropdownMenuItem(
                                value: "11",
                                child: Text("Week 11"),
                              ),
                              DropdownMenuItem(
                                value: "12",
                                child: Text("Week 12"),
                              ),
                              DropdownMenuItem(
                                value: "13",
                                child: Text("Week 13"),
                              ),
                              DropdownMenuItem(
                                value: "14",
                                child: Text("Week 14"),
                              ),
                              DropdownMenuItem(
                                value: "15",
                                child: Text("Week 15"),
                              ),
                              DropdownMenuItem(
                                value: "16",
                                child: Text("Week 16"),
                              ),
                              DropdownMenuItem(
                                value: "17",
                                child: Text("Week 17"),
                              ),
                              DropdownMenuItem(
                                value: "18",
                                child: Text("Week 18"),
                              ),
                            ],
                            onChanged: (value) { //get value when changed
                              print("You have selected $value");
                              if(int.parse(value.toString()) < int.parse(week.toString())){
                                showError("Please select current or future weeks");
                              }else{
                                setState(() {
                                  vm.value = value.toString();
                                  vm.isLoading = true;
                                  getData();
                                });
                              }

                            },
                            icon: Icon(Icons.keyboard_arrow_down,
                              color: AppColor.greenColor,),
                            iconEnabledColor: Colors.white,
                            //Icon color
                            style: TextStyle(
                                fontFamily: "Med",
                                color: AppColor.greenColor, //Font color
                                fontSize: 13 //font size on dropdown button
                            ),

                            dropdownColor: Colors.black,
                            //dropdown background color
                            underline: Container(),
                            //remove underline
                            isExpanded: true, //make true to make width 100%
                          )
                      )
                  ),
                ),

                Row(
                  children: [
                    if(vm.bettingData.isNotEmpty)CommonText("${dateFormatBetting2(vm.bettingData[0].dateTime.toString())} - ${dateFormatBetting(vm.bettingData[0].dateTime.toString())}", 12, AppColor.whiteColor, TextAlign.end),
                    const SizedBox(width: 5,),
                    Icon(
                      Icons.calendar_month_outlined, color: AppColor.greenColor,
                      size: 15,)

                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Expanded(child: (vm.isLoading == true)
              ?Progress()
              :(vm.bettingData.isEmpty)
              ?NoData("No Betting Data", "assets/images/no_data.png", context)
              :ListView.builder(
                  itemCount: vm.bettingData.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    var data = dateTimeFormatCheck(vm.bettingData[index].dateTime.toString());
                    return (data == true)?const SizedBox():Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                color: AppColor.dialogBackgroundColor,
                                child: RichText(text: TextSpan(
                                    text: dateTimeFormat(vm.bettingData[index].dateTime.toString()),
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontFamily: "Reg",
                                        color: AppColor.whiteColor),
                                    children: [
                                      TextSpan(
                                        text: ' @KC',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontFamily: "Bold",
                                            color: AppColor.whiteColor),),
                                    ])),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                color: AppColor.backColor,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    CommonText(
                                        "Spread", 11, AppColor.whiteColor,
                                        TextAlign.center),
                                    CommonText("ML", 11, AppColor.whiteColor,
                                        TextAlign.center),
                                    CommonText("total", 11, AppColor.whiteColor,
                                        TextAlign.center),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    const SizedBox(width: 20,),
                                    (vm.bettingData[index].homeTeamImg.toString() == "null")
                                        ?Image.asset("assets/images/instagram.png",height: 25,width: 25,)
                                        :SizedBox(
                                        height: 30, width: 30,
                                        child: SvgPicture.network(vm.bettingData[index].homeTeamImg.toString(),)),
                                    // Image.asset("assets/images/instagram.png",height: 25,width: 25,),
                                    const SizedBox(width: 10,),
                                    MediumText(vm.bettingData[index].homeTeamName
                                        .toString(), 25, AppColor.whiteColor,
                                        TextAlign.start)
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 45,
                                      height: 45,
                                      margin: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          border: Border.all(
                                              color: AppColor.hintColor)
                                      ),
                                      padding: const EdgeInsets.all(2),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          MediumText(
                                              (vm.bettingData[index].pregameOdds![0]
                                                  .homePointSpread.toString() ==
                                                  "null")
                                                  ? '0'
                                                  : vm.bettingData[index]
                                                  .pregameOdds![0].homePointSpread
                                                  .toString(), 12,
                                              AppColor.whiteColor,
                                              TextAlign.start),
                                          const SizedBox(height: 2,),
                                          MediumText(
                                              (vm.bettingData[index].pregameOdds![0]
                                                  .homePointSpreadPayout
                                                  .toString() == "null")
                                                  ? '0'
                                                  : vm.bettingData[index]
                                                  .pregameOdds![0]
                                                  .homePointSpreadPayout
                                                  .toString(), 12,
                                              AppColor.textGreenColor,
                                              TextAlign.start),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 45,
                                      height: 45,
                                      margin: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          border: Border.all(
                                              color: AppColor.hintColor)
                                      ),
                                      padding: const EdgeInsets.all(2),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          MediumText(
                                              vm.bettingData[index].pregameOdds![0]
                                                  .homeMoneyLine.toString(), 12,
                                              AppColor.textGreenColor,
                                              TextAlign.center),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 45,
                                      height: 45,
                                      margin: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          border: Border.all(
                                              color: AppColor.hintColor)
                                      ),
                                      padding: const EdgeInsets.all(2),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          // MediumText("O 53.5", 12, AppColor.whiteColor, TextAlign.start),
                                          // const SizedBox(height: 2,),
                                          MediumText((vm.bettingData[index].pregameOdds![0].overUnder == null)?"O${vm.bettingData[index].pregameOdds![1].overUnder}":"O${vm.bettingData[index].pregameOdds![0].overUnder}", 12, AppColor.textGreenColor, TextAlign.center),
                                          MediumText((vm.bettingData[index].pregameOdds![0].overPayout == null)?"${vm.bettingData[index].pregameOdds![1].overPayout}":"${vm.bettingData[index].pregameOdds![0].overPayout}", 12, AppColor.whiteColor, TextAlign.center),

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),),
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    const SizedBox(width: 20,),
                                    (vm.bettingData[index].awayTeamImg.toString() == "null")
                                        ?Image.asset("assets/images/instagram.png",height: 25,width: 25,)
                                        : SizedBox(
                    height: 30, width: 30,
                                        child: SvgPicture.network(vm.bettingData[index].awayTeamImg.toString())),
                                    const SizedBox(width: 10,),
                                    MediumText(vm.bettingData[index].awayTeamName
                                        .toString(), 25, AppColor.whiteColor,
                                        TextAlign.start)
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 45,
                                      height: 45,
                                      margin: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          border: Border.all(
                                              color: AppColor.hintColor)
                                      ),
                                      padding: const EdgeInsets.all(2),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          MediumText(
                                              (vm.bettingData[index].pregameOdds![0]
                                                  .awayPointSpread.toString() ==
                                                  "null")
                                                  ? '0'
                                                  : vm.bettingData[index]
                                                  .pregameOdds![0].awayPointSpread
                                                  .toString(), 12,
                                              AppColor.whiteColor,
                                              TextAlign.start),
                                          const SizedBox(height: 2,),
                                          MediumText(
                                              (vm.bettingData[index].pregameOdds![0]
                                                  .awayPointSpreadPayout
                                                  .toString() == "null")
                                                  ? '0'
                                                  : vm.bettingData[index]
                                                  .pregameOdds![0]
                                                  .awayPointSpreadPayout
                                                  .toString(), 12,
                                              AppColor.textGreenColor,
                                              TextAlign.start),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 45,
                                      height: 45,
                                      margin: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          border: Border.all(
                                              color: AppColor.hintColor)
                                      ),
                                      padding: const EdgeInsets.all(2),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          MediumText(
                                              vm.bettingData[index].pregameOdds![0]
                                                  .awayMoneyLine.toString(), 12,
                                              AppColor.textGreenColor,
                                              TextAlign.center),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 45,
                                      height: 45,
                                      margin: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          border: Border.all(
                                              color: AppColor.hintColor)
                                      ),
                                      padding: const EdgeInsets.all(2),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          // MediumText("U 53.5", 12, AppColor.whiteColor, TextAlign.start),
                                          // const SizedBox(height: 2,),
                                          MediumText((vm.bettingData[index].pregameOdds![0].overUnder == null)?"U${vm.bettingData[index].pregameOdds![1].overUnder}":"U${vm.bettingData[index].pregameOdds![0].overUnder}", 12, AppColor.textGreenColor, TextAlign.center),
                                          MediumText((vm.bettingData[index].pregameOdds![0].underPayout == null)?"${vm.bettingData[index].pregameOdds![1].underPayout}":"${vm.bettingData[index].pregameOdds![0].underPayout}", 12, AppColor.whiteColor, TextAlign.center),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),),
                        const SizedBox(height: 20,),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (
                                context) => BettingDetail(
                                date : dateTimeFormat(vm.bettingData[index].dateTime.toString()),
                                scoreId : vm.bettingData[index].pregameOdds![0].scoreId.toString(),
                              awayImg : vm.bettingData[index].awayTeamImg.toString(),
                              awayName : vm.bettingData[index].awayTeamName.toString(),
                              homeImg : vm.bettingData[index].homeTeamImg.toString(),
                              homeName : vm.bettingData[index].homeTeamName.toString(),

                            )));
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(right: 20),
                            child: BoldText(
                                "View More +", 13, AppColor.textGreenColor,
                                TextAlign.end),
                          ),
                        ),
                        const SizedBox(height: 20,),
                      ],
                    );
                  }))
        ],
      ),
    );
  }

  Future<void> getData() async {
    vm.bettingData.clear();
    String res = await thirdPartyMethod("GET","https://api.sportsdata.io/v3/nfl/odds/json/GameOddsByWeek/$season/${vm.value.toString()}?key=${AllKeys.sportsKey}", null, null, context);

    var response = jsonDecode(res);

    List<dynamic> list = [];
    list.addAll(response);

    for (var i = 0; i < list.length; i++) {
      BettingDataModel bettingDataNew = BettingDataModel.fromJson(list[i]);
      vm.bettingData.add(bettingDataNew);
    }

    for (var k = 0; k < vm.bettingData.length; k++) {

      for (var j = 0; j < allTeams.length; j++) {

        if (vm.bettingData[k].awayTeamId.toString() == allTeams[j].teamID.toString()) {
          vm.bettingData[k].awayTeamImg = allTeams[j].wikipediaLogoUrl.toString();
          vm.bettingData[k].name = allTeams[j].name.toString();
        }else if (vm.bettingData[k].homeTeamId.toString() == allTeams[j].teamID.toString()) {
          vm.bettingData[k].homeTeamImg = allTeams[j].wikipediaLogoUrl.toString();
          vm.bettingData[k].name = allTeams[j].name.toString();
        }

      }

    }

    setState(() {

      vm.isLoading = false;

    });

  }


}
