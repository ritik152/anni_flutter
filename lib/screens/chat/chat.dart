import 'dart:async';
import 'dart:convert';

import 'package:anni_ai/dialogs/start_chat_dialog.dart';
import 'package:anni_ai/dialogs/swipe_right_dialog.dart';
import 'package:anni_ai/screens/chat/chat_vm.dart';
import 'package:anni_ai/screens/chat/receiver_text_view.dart';
import 'package:anni_ai/screens/chat/sender_text_view.dart';
import 'package:anni_ai/utils/buttons.dart';
import 'package:anni_ai/utils/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

import '../../dialogs/swipe_left_dialog.dart';
import '../../utils/common.dart';
import '../../utils/common_widget.dart';
import '../line_chart.dart';
import 'chat_loader.dart';
import 'drawers/left_drawer/left_drawer.dart';
import 'drawers/right_drawer/right_drawer.dart';


class Chat extends StatefulWidget {
  String? from;
  Chat({Key? key,this.from}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  late FlutterTts flutterTts;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  String? _newVoiceText;

  var vm = ChatVm();
  List<Map<String, dynamic>> map = [];

  @override
  void initState() {
    super.initState();

    // initTts();

    if(widget.from == "signup"){
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await showDialog(
            barrierDismissible: false,
            barrierColor: AppColor.dialogBackgroundColor,
            context: context, builder: (context)=> const StartChatDialog());
      });
    }

    getData();
  }


 /* initTts() {
    flutterTts = FlutterTts();

    _setAwaitOptions();

    if (isAndroid) {
      _getDefaultEngine();
      _getDefaultVoice();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });

    if (isAndroid) {
      flutterTts.setInitHandler(() {
        setState(() {
          print("TTS Initialized");
        });
      });
    }

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setPauseHandler(() {
      setState(() {
        print("Paused");
        ttsState = TtsState.paused;
      });
    });

    flutterTts.setContinueHandler(() {
      setState(() {
        print("Continued");
        ttsState = TtsState.continued;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }*/


  Future _speak(String? newVoiceText) async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    if (newVoiceText != null) {
      if (newVoiceText!.isNotEmpty) {
        await flutterTts.speak(newVoiceText!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.black,
        drawer: const LeftDrawer(),
        endDrawer: const RightDrawer(),
        drawerEdgeDragWidth: MediaQuery.of(context).size.width*0.50,
        endDrawerEnableOpenDragGesture: true,
        body: Container(
          height: double.infinity,
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/ai_image.png",
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.30,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    height: MediaQuery.of(context).size.height * 0.30,
                    margin: const EdgeInsets.only(right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            var value = await showTopModalSheet<String>(
                                context, NewChat());
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            width: double.infinity,
                            alignment: Alignment.centerRight,
                            child: Image.asset("assets/icons/add_icon.png",
                                height: 35, width: 35),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                var value = await showTopModalSheet<String>(
                                    context, SaveChat());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/icons/save.png",
                                    height: 35, width: 35),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:  GestureDetector(
                                  onTap: () async {

                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> LineChartSample6()));
                                    vm.mute = !vm.mute;
                                    setState(() {

                                    });
                                  },
                                  child: Image.asset((vm.mute == true)?"assets/icons/mute_icon.png":"assets/icons/volume.png",height: 35,width: 35)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: (vm.chatArray.isEmpty)?
                ListView.builder(
                  itemCount: vm.questionsList.length,
                    itemBuilder: (context,indexQ){
                  return GestureDetector(
                    onTap: (){
                      vm.question = vm.questionsList[indexQ].toString();
                      sendMessage();
                    },
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                          top: 2, bottom: 2, right: 10, left: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: AppColor.hintColor)),
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 70,
                              child: CommonText(
                                  vm.questionsList[indexQ].toString(),
                                  14,
                                  AppColor.whiteColor,
                                  TextAlign.start)),
                          Expanded(
                              flex: 10,
                              child: Image.asset(
                                "assets/icons/send.png",
                                height: 25,
                                color: AppColor.greenColor,
                              ))
                        ],
                      ),
                    ),
                  );
                }):
               /* ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: 10,top: 10),
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 2,bottom: 2,right: 10,left: 10),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
                            border: Border.all(color: AppColor.hintColor)
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Expanded(
                            flex: 70,
                            child: CommonText(question, 14, AppColor.whiteColor, TextAlign.start)),
                      );
                    }),*/
                ListView(
                  controller: vm.scrollController,
                  padding: EdgeInsets.zero,
                  children: getChatList(vm.chatArray),
                )
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    decoration: BoxDecoration(
                        color: AppColor.backColor,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 10, top: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Flexible(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxHeight: 200),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: AppColor.fieldBack,
                                  /*boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 3,
                                          color: Colors.grey.withOpacity(0.3),
                                          offset: const Offset(0, 2))
                                    ]*/
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 80,
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 0.0),
                                        child: TextField(
                                          onTap: (){

                                          },
                                          controller: vm.chatController,
                                          maxLines: null,
                                          keyboardType: TextInputType.text,
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: AppColor.fieldBackColor,
                                              fontWeight: FontWeight.w400),
                                          decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.only(top: 5, bottom: 5),
                                            hintText: 'Type here',
                                            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13, fontWeight: FontWeight.w400),
                                            border: InputBorder.none,
                                            prefix: const SizedBox(width: 15,),),
                                        ),
                                      ),
                                    ),
                                    Container(height: 25,width: 1,color: AppColor.hintColor,),
                                    Expanded(
                                        flex: 15,
                                        child: GestureDetector(
                                          onTap: (){
                                            sendMessage();
                                          },
                                            child: Image.asset("assets/icons/send.png",height: 25,color: AppColor.greenColor,)))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        )
    );
  }

  List<Widget> getChatList(List<LocalChatData> messages) {
    List<Widget> mArray = [];
    for (var item in messages) {
      if (item.isFrom == 'human') {
        mArray.add(GestureDetector(
          onLongPress: () async {
           /* var result = await showDialog(
              barrierDismissible: false, context: context, builder: (
                BuildContext context) => MessageDailog(chatData: item),);
            return result;*/
          },
          child: SenderTextView(
            chatData: item,
            email: vm.email,
          ),
        ));
      }
      else if (item.isFrom == 'loader') {
        mArray.add(const ChatLoader());
      }
      else {
        mArray.add(GestureDetector(
          onLongPress: () {

          },
          child: ReceiverTextView(
            chatData: item,
            isLast: (item.id == messages.last.id) ? true : false,
            vm: vm,
            regeratedTapped: (){
              makeSendAIChatRequest(vm.lastQuestion);
            },
          ),
        ));
      }
    }
    return mArray;
  }


  Future<void> sendMessage() async {
    if (vm.chatController.text.trim().isNotEmpty) {
      FocusManager.instance.primaryFocus?.unfocus();
      String message = '';
      LocalChatData data = LocalChatData(isFrom: 'human', humanMesasge: vm.chatController.text, aiMessage: '', category: 'chat', prompt: "", description: "", id: vm.chatId);
      vm.chatArray.add(data);
      message = vm.chatController.text;
      vm.lastQuestion = message;
      vm.chatController.text = '';
      vm.lastWords = '';

      makeSendAIChatRequest(message);
    }else if(vm.question != ""){
      FocusManager.instance.primaryFocus?.unfocus();
      String message = '';
      LocalChatData data = LocalChatData(isFrom: 'human', humanMesasge: vm.question, aiMessage: '', category: 'chat', prompt: "", description: "", id: vm.chatId);
      vm.chatArray.add(data);
      message = vm.question;
      vm.lastQuestion = message;
      vm.chatController.text = '';
      vm.lastWords = '';
      vm.question = '';
      makeSendAIChatRequest(message);
    }
  }

  makeSendAIChatRequest(String message) async {
    LocalChatData loaderData = LocalChatData(
        isFrom: 'loader',
        humanMesasge: message,
        aiMessage: '',
        category: 'chat',
        prompt: "",
        description: "",
        id: vm.chatId);

    vm.chatArray.add(loaderData);
    setState(() {
      vm.timer = Timer(const Duration(milliseconds: 200), () {
        setState(() {
          vm.scrollController.animateTo(vm.scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
          vm.timer.cancel();
        });
      });
    });

    var model;

    Map<String, dynamic> data1 = {};
    Map<String, dynamic> dataHuman = {};

      data1 = {"role": "assistant", "content": "my name is Anni"};
      dataHuman = {"role": "user","content": message.trim()};


    if(map.isEmpty){
      map.add(data1);
    }

    map.add(dataHuman);
    var jsondecod = json.encode(map);
    String dataMess = jsondecod;

    model = await vm.chatWithAI({'chat': dataMess}, context);

    if(model.code == 400){
      showError(model.message.toString());
    }
    if (!mounted) {
      return;
    }
    vm.chatArray.removeLast();
    if (model.success == 1) {
      vm.errorMesasge = '';


      Map<String, dynamic> dataAi = {};
      dataAi = {"role":"assistant","content": model.body?.choices?[0].message.content ?? ''};
      map.add(dataAi);
      debugPrint('Here i got');
      LocalChatData aiData = LocalChatData(isFrom: 'ai', humanMesasge: message, aiMessage: model.body?.choices?.first.message.content ?? '', category: 'chat', prompt: "", description: "", id: vm.chatId);

      vm.chatId += 1;
      vm.chatArray.add(aiData);
      setState(() {
        vm.timer = Timer(const Duration(milliseconds: 200), () {
          setState(() {
            vm.scrollController.animateTo(
                vm.scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut);
            vm.timer.cancel();
            _newVoiceText = model.body?.choices?.first.message.content.toString();
            _speak(_newVoiceText);
          });

        });


      });
    }
    else if ((model.code ?? 0) == 429) {
      makeSendAIChatRequest(message);
    }
    else {
      if ((model.message ?? '') ==
          'You have reached your daily word limit') {
        vm.errorMesasge = '';
      } else {
        vm.errorMesasge = model.message ?? '';
      }
      setState(() {});

    }

  }

  Widget NewChat() {
    return Container(
      color: AppColor.black,
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          BoldText("Start a New Chat?", 17, AppColor.whiteColor, TextAlign.center),
          const SizedBox(
            height: 10,
          ),
          CommonText("Any unsaved conversation will be erased.", 12,
              AppColor.whiteColor, TextAlign.center),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: BoldText(
                          "Cancel", 13, Colors.white, TextAlign.center))),
              Expanded(
                  child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RoundedButton(
                    text: "New Chat",
                    color: AppColor.black,
                    buttonColor: AppColor.redColor,
                    radios: 30,
                    onTap: () {
                      vm.chatArray.clear();
                      setState(() {

                      });
                      Navigator.pop(context);
                    }),
              )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            color: AppColor.redColor,
            height: 1.5,
          )
        ],
      ),
    );
  }

  Widget SaveChat() {
    return Container(
      color: AppColor.black,
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          BoldText("Save Chat?", 17, AppColor.whiteColor, TextAlign.center),
          const SizedBox(
            height: 10,
          ),
          CommonText("Title this conversation", 12, AppColor.whiteColor,
              TextAlign.center),
          const SizedBox(
            height: 10,
          ),

          //-----------------------------Title---------------------------------------
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColor.liteGrayColor,
                borderRadius: BorderRadius.circular(30)),
            margin: const EdgeInsets.only(right: 20, left: 20),
            child: TextFormField(
              controller: vm.saveChatController,
              cursorColor: Colors.white,
              keyboardType: TextInputType.text,
              style: TextStyle(color: AppColor.whiteColor),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  hintText: "Title Chat..",
                  hintStyle: TextStyle(color: AppColor.hintColor)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //-----------------------------Buttons---------------------------------------
          Row(
            children: [
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: BoldText(
                          "Cancel", 13, Colors.white, TextAlign.center))),
              Expanded(
                  child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RoundedButton(
                    text: "Save",
                    color: AppColor.black,
                    buttonColor: AppColor.greenColor,
                    radios: 30,
                    onTap: () {
                      if(vm.chatArray.isEmpty){
                        showError("Chat box is empty");
                      }
                      else if(vm.saveChatController.text.toString().trim() == ""){
                        showError("Please enter chat title");
                      }
                      else{

                        // String json = jsonEncode(chatArray);
                        List<Map<String, String>> messageList = [];

                        for (var i = 0; i < vm.chatArray.length; i++) {
                          Map<String, String> mapRate = <String, String>{};
                          mapRate['isFrom'] = vm.chatArray[i].isFrom.toString();
                          mapRate['humanMesasge'] = vm.chatArray[i].humanMesasge.toString();
                          mapRate['aiMessage'] = vm.chatArray[i].aiMessage.toString();
                          mapRate['category'] = vm.chatArray[i].category.toString();
                          mapRate['prompt'] = vm.chatArray[i].prompt.toString();
                          mapRate['description'] = vm.chatArray[i].description.toString();
                          mapRate['id'] = vm.chatArray[i].id.toString();
                          messageList.add(mapRate);
                        }

                        String json = jsonEncode(messageList);

                        Map<String, String> map = {
                          "title":vm.saveChatController.text.toString().trim(),
                          "type":"0",
                          "json_data":json,
                        };

                        vm.saveChatThread(map,context);
                      }
                    }),
              )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            color: AppColor.greenColor,
            height: 1.5,
          )
        ],
      ),
    );
  }

  Future<void> getData() async {
    vm.getSavedChat(context);
    var data = await vm.getProfile(context);

    if(data){
      setState(() {

      });
    }

  }
}
