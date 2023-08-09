import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/common_widget.dart';
import '../betting_detail/betting_detail.dart';

class BeatingData extends StatefulWidget {
  const BeatingData({Key? key}) : super(key: key);

  @override
  State<BeatingData> createState() => _BeatingDataState();
}

class _BeatingDataState extends State<BeatingData> {
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
            const EdgeInsets.only(top: 35, bottom: 20, right: 20, left: 20),
            child: Stack(
              children: [

                SizedBox(
                  width: double.infinity,
                  child: BoldText("Betting Data", 14, AppColor.whiteColor, TextAlign.center),
                ),
                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios,color: AppColor.greenColor,)),
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
                          color:AppColor.black, //background color of dropdown button
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: AppColor.hintColor),
                          boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                                blurRadius: 5) //blur radius of shadow
                          ]
                      ),

                      child:Padding(
                          padding: const EdgeInsets.all(10),
                          child:DropdownButton(
                            value: "Week 1",
                            items: const [ //add items in the dropdown
                              DropdownMenuItem(
                                value: "Week 1",
                                child: Text("Week 1"),
                              ),
                              DropdownMenuItem(
                                  value: "Week 2",
                                  child: Text("Week 2")
                              ),
                              DropdownMenuItem(
                                value: "Week 3",
                                child: Text("Week 3"),
                              ),
                              DropdownMenuItem(
                                value: "Week 4",
                                child: Text("Week 4"),
                              ),
                              DropdownMenuItem(
                                value: "Week 5",
                                child: Text("Week 5"),
                              ),
                              DropdownMenuItem(
                                value: "Week 6",
                                child: Text("Week 6"),
                              ),
                              DropdownMenuItem(
                                value: "Week 7",
                                child: Text("Week 7"),
                              ),
                              DropdownMenuItem(
                                value: "Week 8",
                                child: Text("Week 8"),
                              ),
                              DropdownMenuItem(
                                value: "Week 9",
                                child: Text("Week 9"),
                              ),
                              DropdownMenuItem(
                                value: "Week 10",
                                child: Text("Week 10"),
                              ),
                              DropdownMenuItem(
                                value: "Week 11",
                                child: Text("Week 11"),
                              ),
                              DropdownMenuItem(
                                value: "Week 12",
                                child: Text("Week 12"),
                              ),
                              DropdownMenuItem(
                                value: "Week 13",
                                child: Text("Week 13"),
                              ),
                              DropdownMenuItem(
                                value: "Week 14",
                                child: Text("Week 14"),
                              ),
                              DropdownMenuItem(
                                value: "Week 15",
                                child: Text("Week 15"),
                              ),
                              DropdownMenuItem(
                                value: "Week 16",
                                child: Text("Week 16"),
                              ),
                              DropdownMenuItem(
                                value: "Week 17",
                                child: Text("Week 17"),
                              ),
                              DropdownMenuItem(
                                value: "Week 18",
                                child: Text("Week 18"),
                              ),
                              DropdownMenuItem(
                                value: "Week 19",
                                child: Text("Week 19"),
                              ),

                            ],
                            onChanged: (value){ //get value when changed
                              print("You have selected $value");
                            },
                            icon: Icon(Icons.keyboard_arrow_down,color: AppColor.greenColor,),
                            iconEnabledColor: Colors.white, //Icon color
                            style: TextStyle(
                                fontFamily: "Med",
                                color: AppColor.greenColor, //Font color
                                fontSize: 13 //font size on dropdown button
                            ),

                            dropdownColor: Colors.black, //dropdown background color
                            underline: Container(), //remove underline
                            isExpanded: true, //make true to make width 100%
                          )
                      )
                  ),
                ),
                Row(
                  children: [
                    CommonText("Sep 7 - Sep 13", 12, AppColor.whiteColor, TextAlign.end),
                    const SizedBox(width: 5,),
                    Icon(Icons.calendar_month_outlined,color: AppColor.greenColor,size: 15,)

                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                color: AppColor.dialogBackgroundColor,
                                child: RichText(text: TextSpan(
                                    text: '8:21 PM Sep 7 ',
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontFamily: "Reg",
                                        color: AppColor.whiteColor),
                                    children: [
                                      TextSpan(
                                        text: '@KC',
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
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CommonText("Spread", 11, AppColor.whiteColor, TextAlign.center),
                                    CommonText("ML", 11, AppColor.whiteColor, TextAlign.center),
                                    CommonText("total", 11, AppColor.whiteColor, TextAlign.center),
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
                                  Image.asset("assets/images/instagram.png",height: 25,width: 25,),
                                  const SizedBox(width: 10,),
                                  MediumText("Lions", 25, AppColor.whiteColor, TextAlign.start)
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
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: AppColor.hintColor)
                                    ),
                                    padding: const EdgeInsets.all(2),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        MediumText("+6.5", 12, AppColor.whiteColor, TextAlign.start),
                                        const SizedBox(height: 2,),
                                        MediumText("-105", 12, AppColor.textGreenColor, TextAlign.start),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 45,
                                    height: 45,
                                    margin: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: AppColor.hintColor)
                                    ),
                                    padding: const EdgeInsets.all(2),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        MediumText("+250", 12, AppColor.textGreenColor, TextAlign.start),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 45,
                                    height: 45,
                                    margin: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: AppColor.hintColor)
                                    ),
                                    padding: const EdgeInsets.all(2),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        MediumText("O 53.5", 12, AppColor.whiteColor, TextAlign.start),
                                        const SizedBox(height: 2,),
                                        MediumText("-110", 12, AppColor.textGreenColor, TextAlign.start),
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
                                  Image.asset("assets/images/instagram.png",height: 25,width: 25,),
                                  const SizedBox(width: 10,),
                                  MediumText("Chiefs", 25, AppColor.whiteColor, TextAlign.start)
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
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: AppColor.hintColor)
                                    ),
                                    padding: const EdgeInsets.all(2),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        MediumText("+6.5", 12, AppColor.whiteColor, TextAlign.start),
                                        const SizedBox(height: 2,),
                                        MediumText("-115", 12, AppColor.textGreenColor, TextAlign.start),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 45,
                                    height: 45,
                                    margin: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: AppColor.hintColor)
                                    ),
                                    padding: const EdgeInsets.all(2),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        MediumText("+310", 12, AppColor.textGreenColor, TextAlign.start),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 45,
                                    height: 45,
                                    margin: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: AppColor.hintColor)
                                    ),
                                    padding: const EdgeInsets.all(2),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        MediumText("U 53.5", 12, AppColor.whiteColor, TextAlign.start),
                                        const SizedBox(height: 2,),
                                        MediumText("-110", 12, AppColor.textGreenColor, TextAlign.start),
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
                          onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const BettingDetail()));
                    },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(right: 20),
                            child: BoldText("View More +", 13, AppColor.textGreenColor, TextAlign.end),
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
}
