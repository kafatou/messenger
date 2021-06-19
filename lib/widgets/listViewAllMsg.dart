import 'package:flutter/material.dart';
import 'package:messenger_project/Models/message.dart';
import 'package:messenger_project/widgets/Memessage.dart';

class ListViewAllMsg extends StatelessWidget {
  List<Message> listMsg=new List();
  bool isMe;
  ListViewAllMsg(this.listMsg,this.isMe);
  @override
  Widget build(BuildContext context) {
    print('hereeeeeeee');
    print(isMe.toString());
    return ListView.builder(
      itemCount: listMsg.length,
      itemBuilder: (context,position)
      {
        return Memessage(isMe: isMe,msg:listMsg[position].message);
      },
    );
  }
}