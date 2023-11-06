import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:anni_ai/screens/chat/chat_vm.dart';
import 'package:anni_ai/screens/saved_chat_detail/saved_chat_vm.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:video_player/video_player.dart';
import '../../dialogs/delete_save_chat/delete_save_chat.dart';
import '../../utils/color.dart';
import '../../utils/common.dart';
import '../../utils/common_widget.dart';
import '../chat/chat_loader.dart';
import '../chat/receiver_text_view.dart';
import '../chat/sender_text_view.dart';

class SavedChatDetail extends StatefulWidget {
  List<Map<String, String>> messageList;
  int? chatId;
  String title;
  ChatVm vm;
  SavedChatDetail(
      {Key? key,
      required this.messageList,
      this.chatId,
      required this.title,
      required this.vm})
      : super(key: key);

  @override
  State<SavedChatDetail> createState() => _SavedChatDetailState();
}

enum TtsState { playing, stopped, paused, continued }

class _SavedChatDetailState extends State<SavedChatDetail> {
  var vm = SavedChatVm();
  var mute = false;
  // late VideoPlayerController controllerSaved;
  List<Map<String, dynamic>> map = [];

  late FlutterTts flutterTts;
  String? language;
  String? engine;

  double volume = 1;

  double pitch = 1.1;

  double rate = 0.5;
  bool isCurrentLanguageInstalled = false;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWindows => !kIsWeb && Platform.isWindows;
  bool get isWeb => kIsWeb;

  @override
  void initState() {
    super.initState();

    initTts();

    if (widget.messageList.isNotEmpty) {
      for (var i = 0; i < widget.messageList.length; i++) {
        LocalChatDataSaved aiData = LocalChatDataSaved(
            isFrom: widget.messageList[i]["isFrom"].toString(),
            humanMesasge: widget.messageList[i]["humanMesasge"].toString(),
            aiMessage: widget.messageList[i]["aiMessage"].toString(),
            category: 'chat',
            prompt: widget.messageList[i]["prompt"].toString(),
            description: widget.messageList[i]["description"].toString(),
            id: int.parse(widget.messageList[i]["id"].toString()));

        Map<String, dynamic> dataHuman = {};
        Map<String, dynamic> dataAi = {};
        dataAi = {
          "role": "assistant",
          "content": widget.messageList[i]["aiMessage"].toString()
        };
        dataHuman = {
          "role": "user",
          "content": widget.messageList[i]["humanMesasge"].toString()
        };

        map.add(dataHuman);
        if (widget.messageList[i]["aiMessage"].toString() != "") {
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

  initTts() async {
    flutterTts = FlutterTts();

    _setAwaitOptions();

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
        widget.vm.controller.play();
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
        widget.vm.controller.pause();
        widget.vm.controller.seekTo(const Duration(seconds: 0));
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
  }

  Future _speak(String? newVoiceText) async {
    await flutterTts.setVoice({"name": "Karen", "locale": "en-IN"});
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    if (newVoiceText != null) {
      if (newVoiceText.isNotEmpty) {
        await flutterTts.speak(newVoiceText);
      }
    }
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
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
                      width: double.infinity,
                      height: 210,
                      child: VideoPlayer(widget.vm.controller),
                      // Image.asset("assets/images/anni_image.png",width: double.infinity,height: 200,fit: BoxFit.cover,),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.only(top: 55),
                      height: 200,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () {
                              mute = !mute;
                              setState(() {
                                if (mute == true) {
                                  widget.vm.controller.pause();
                                  widget.vm.controller
                                      .seekTo(const Duration(seconds: 0));
                                  _stop();
                                }
                              });
                            },
                            child: Image.asset(
                                (mute == true)
                                    ? "assets/icons/mute_icon.png"
                                    : "assets/icons/volume.png",
                                height: 35,
                                width: 35)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.backColor,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      padding: const EdgeInsets.only(
                          top: 45, bottom: 20, right: 20, left: 20),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: BoldText(widget.title, 14,
                                AppColor.whiteColor, TextAlign.center),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context, true);
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: AppColor.greenColor,
                              )),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                      barrierColor:
                                          AppColor.dialogBackgroundColor,
                                      context: context,
                                      builder: (context) => DeleteSaveChat(
                                          chatId: widget.chatId));
                                },
                                child: Icon(
                                  Icons.delete_forever,
                                  color: AppColor.whiteColor,
                                  size: 25,
                                )),
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
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.only(
                          left: 25.0, right: 25.0, bottom: 10, top: 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Flexible(
                              child: ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxHeight: 200),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: AppColor.fieldBack,
                                      border:
                                          Border.all(color: AppColor.backColor)
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
                                          padding: const EdgeInsets.only(
                                              bottom: 0.0),
                                          child: TextField(
                                            onTap: () {},
                                            maxLines: null,
                                            controller: vm.chatController,
                                            keyboardType: TextInputType.text,
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: AppColor.fieldBackColor,
                                                fontWeight: FontWeight.w400),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      top: 5, bottom: 5),
                                              hintText: 'Type here',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey.shade400,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400),
                                              border: InputBorder.none,
                                              prefix: const SizedBox(
                                                width: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 25,
                                        width: 1,
                                        color: AppColor.hintColor,
                                      ),
                                      Expanded(
                                          flex: 15,
                                          child: GestureDetector(
                                              onTap: () {
                                                sendMessage();
                                              },
                                              child: Image.asset(
                                                "assets/icons/send.png",
                                                height: 25,
                                                color: AppColor.greenColor,
                                              )))
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
        ));
  }

  Future<void> sendMessage() async {
    if (vm.chatController.text.trim().isNotEmpty) {
      FocusManager.instance.primaryFocus?.unfocus();
      String message = '';
      LocalChatDataSaved data = LocalChatDataSaved(
          isFrom: 'human',
          humanMesasge: vm.chatController.text,
          aiMessage: '',
          category: 'chat',
          prompt: "",
          description: "",
          id: vm.chatId);
      vm.chatArray.add(data);
      message = vm.chatController.text;
      vm.lastQuestion = message;
      vm.chatController.text = '';
      vm.lastWords = '';

      makeSendAIChatRequest(message);
    }
  }

  List<Widget> getChatList(List<LocalChatDataSaved> messages) {
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
      } else if (item.isFrom == 'loader') {
        mArray.add(const ChatLoader());
      } else {
        if (item.aiMessage != "" || item.aiMessage != "BLANK") {
          mArray.add(GestureDetector(
            onLongPress: () {},
            child: ReceiverTextView(
              chatData: item,
              isLast: (item.id == messages.last.id) ? true : false,
              vm: vm,
              regeratedTapped: () {
                makeSendAIChatRequest(vm.lastQuestion);
              },
            ),
          ));
        }
      }
    }
    return mArray;
  }

  makeSendAIChatRequest(String message) async {
    LocalChatDataSaved loaderData = LocalChatDataSaved(
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
          vm.scrollController.animateTo(
              vm.scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut);
          vm.timer.cancel();
        });
      });
    });

    var model;

    Map<String, dynamic> data1 = {};
    Map<String, dynamic> dataHuman = {};

    data1 = {
      "role": "system",
      "content":
          "Provide the following information for NFL games: Player Profile, Player's Career Stats, Player's Season Stats, Player Information, Match Information, and Injuries Information."
    };
    dataHuman = {"role": "user", "content": message.trim()};

    if (map.isEmpty) {
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
      dataAi = {
        "role": "assistant",
        "content": model.body?.choices?[0].message.content ?? ''
      };
      map.add(dataAi);
      debugPrint('Here i got');
      LocalChatDataSaved aiData = LocalChatDataSaved(
          isFrom: 'ai',
          humanMesasge: message,
          aiMessage: model.body?.choices?.first.message.content ?? '',
          category: 'chat',
          prompt: "",
          description: "",
          id: vm.chatId);

      vm.chatId += 1;
      if (model.body?.choices?.first.message.content != "BLANK") {
        LocalChatDataSaved aiData = LocalChatDataSaved(
            isFrom: 'ai',
            humanMesasge: message,
            aiMessage: model.body?.choices?.first.message.content ?? '',
            category: 'chat',
            prompt: "",
            description: "",
            id: vm.chatId);
        vm.chatArray.add(aiData);
      } else {
        showError("Please ask National Football League(NFL) related questions");
      }
      setState(() {
        vm.timer = Timer(const Duration(milliseconds: 200), () {
          setState(() {
            vm.scrollController.animateTo(
                vm.scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut);
            vm.timer.cancel();
            var _newVoiceText =
                model.body?.choices?.first.message.content.toString();
            if (mute != true) {
              if (_newVoiceText != "") {
                if (_newVoiceText.toString().contains("CSP") ||
                    _newVoiceText.toString().contains("SSP")) {
                } else {
                  _speak(_newVoiceText);
                }
              } else {
                _speak(
                    "It seems like you've entered another random sequence of characters. If you have any questions or need assistance with anything, please let me know, and I'll be glad to assist you.");
              }
            }
          });
        });
      });
    } else if ((model.code ?? 0) == 429) {
      makeSendAIChatRequest(message);
    } else {
      if ((model.message ?? '') == 'You have reached your daily word limit') {
        vm.errorMesasge = '';
      } else {
        vm.errorMesasge = model.message ?? '';
      }
      setState(() {});
    }
  }
}
