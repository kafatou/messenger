import 'package:flutter/material.dart';
import 'package:messenger_project/Models/message.dart';
import 'package:messenger_project/Models/messageIdentify.dart';
import 'package:messenger_project/widgets/Memessage.dart';

class ListViewAllMsg extends StatelessWidget {
  List<MessageIdentify> listMsg=new List();
  ListViewAllMsg(this.listMsg);
  @override
  Widget build(BuildContext context) {
    // print('hereeeeeeee');
    // print(isMe.toString());
    return ListView.builder(
      itemCount: listMsg.length,
      itemBuilder: (context,position)
      {
        return Memessage(isMe: listMsg[position].isMe,msg:listMsg[position].msg);
      },
    );
  }
}