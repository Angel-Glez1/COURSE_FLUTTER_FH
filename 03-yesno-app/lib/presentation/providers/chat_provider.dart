import 'package:flutter/material.dart';
import 'package:yesnoapp/config/helpers/yes_no_wtf_answer.dart';
import 'package:yesnoapp/domian/entities/Message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [];

  Future<void> sendMessage(String message) async {
    if (message.isEmpty) return;

    final newMessageMe = Message(message: message, fromWho: FromWho.me);
    messageList.add(newMessageMe);

    if (message.endsWith('?')) {
      herReply();
    }
    notifyListeners();
    moveScrollToBotom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBotom();
  }

  void moveScrollToBotom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
