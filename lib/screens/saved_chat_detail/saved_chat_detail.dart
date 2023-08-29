import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import '../../dialogs/delete_save_chat/delete_save_chat.dart';
import '../../utils/color.dart';
import '../../utils/common_widget.dart';
import '../chat/chat_loader.dart';
import '../chat/chat_vm.dart';
import '../chat/receiver_text_view.dart';
import '../chat/sender_text_view.dart';

class SavedChatDetail extends StatefulWidget {
  List<Map<String, String>> messageList;
  int? chatId;
  String title;
  SavedChatDetail({Key? key,required this.messageList,this.chatId, required this.title}) : super(key: key);

  @override
  State<SavedChatDetail> createState() => _SavedChatDetailState();
}

class _SavedChatDetailState extends State<SavedChatDetail> {

  var mute = false;
  var vm = ChatVm();
  List<Map<String, dynamic>> map = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.messageList.isNotEmpty) {
      for (var i = 0; i < widget.messageList.length; i++) {
        LocalChatData aiData = LocalChatData(
            isFrom: widget.messageList[i]["isFrom"].toString(),
            humanMesasge: widget.messageList[i]["humanMesasge"].toString(),
            aiMessage: widget.messageList[i]["aiMessage"].toString(),
            category: 'chat',
            prompt: widget.messageList[i]["prompt"].toString(),
            description: widget.messageList[i]["description"].toString(),
            id: int.parse(widget.messageList[i]["id"].toString()));

        Map<String, dynamic> dataHuman = {};
        Map<String, dynamic> dataAi = {};
        dataAi = {"role":"assistant","content": widget.messageList[i]["aiMessage"].toString()};
        dataHuman = {"role": "user","content": widget.messageList[i]["humanMesasge"].toString()};

        map.add(dataHuman);
        if(widget.messageList[i]["aiMessage"].toString() != ""){
          map.add(dataAi);
        }

        vm.chatArray.add(aiData);
      }

      setState(() {
        vm.timer = Timer(const Duration(milliseconds: 200), () {
          setState(() {
            vm.scrollController.animateTo(
                vm.scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut);
            vm.timer.cancel();
          });
        });
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.black,
        body: Scaffold(
          backgroundColor: Colors.transparent,
          body: SizedBox(
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 60),
                        child: Image.asset("assets/images/anni_image.png",width: double.infinity,height: 200,fit: BoxFit.cover,),),
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.only(top: 55),
                        height: 200,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            mute = !mute;
                            setState(() {

                            });
                          },
                            child: Image.asset((mute == true)?"assets/icons/mute_icon.png":"assets/icons/volume.png",height: 35,width: 35)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.backColor,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      padding: const EdgeInsets.only(top: 45, bottom: 20, right: 20, left: 20),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: BoldText(widget.title, 14, AppColor.whiteColor, TextAlign.center),
                          ),
                          GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back_ios,color: AppColor.greenColor,)),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                                onTap: (){
                                  showDialog(
                                      barrierColor: AppColor.dialogBackgroundColor,
                                      context: context, builder: (context)=>  DeleteSaveChat(chatId: widget.chatId));
                                },
                                child: Icon(Icons.delete_forever,color: AppColor.whiteColor,size: 25,)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    controller: vm.scrollController,
                    padding: EdgeInsets.zero,
                    children: getChatList(vm.chatArray),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      decoration: BoxDecoration(
                          color: AppColor.black,
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
                                      border: Border.all(color: AppColor.backColor)
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
                                            maxLines: null,
                                            controller: vm.chatController,
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
          ),
        )
    );
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
    }
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
          });

        });


      });
    } else if ((model.code ?? 0) == 429) {
      makeSendAIChatRequest(message);
    } else {
      if ((model.message ?? '') ==
          'You have reached your daily word limit') {
        vm.errorMesasge = '';
      } else {
        vm.errorMesasge = model.message ?? '';
      }
      setState(() {});

    }

  }

}
