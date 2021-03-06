import 'package:flutter/material.dart';
import 'package:messenger_project/Models/message.dart';

class Memessage extends StatelessWidget {
  bool isMe;
  Message msg;
  Memessage({@required this.isMe,this.msg});

  @override
  Widget build(BuildContext context) {
    if (isMe)
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  
                  child: msg.isImg==false 
                    ?Text(
                      //"Flutter is better than",
                    msg.message,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    )
                    :Image.network(msg.message),
                )
              ),
            ),
          ],
        ),
      );
    else {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.tealAccent,
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: //msg.isImg==false 
                  /*?Text(
                    //"Flutter is better than",
                    msg.message,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )
                  :*/Image.network(msg.message),
              ),
            ))
          ],
        ),
      );
    }
  }
}
