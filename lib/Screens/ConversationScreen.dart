import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_project/Models/Contact.dart';
import 'package:messenger_project/Models/message.dart';
import 'package:messenger_project/widgets/BottomWidget.dart';
import 'package:messenger_project/widgets/ListViewAllContact.dart';
import 'package:messenger_project/widgets/Memessage.dart';
import 'package:messenger_project/widgets/OneRowContactMessage.dart';
import 'package:messenger_project/widgets/appBarMessage.dart';
import 'package:messenger_project/widgets/listViewAllMsg.dart';

class ConversationScreen extends StatefulWidget {
  Contact contact;
  String email;
  
  List<dynamic> list;
  
  ConversationScreen(this.contact,this.email);
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  List<Message> allMsg = [];
  bool isMe;
  @override
  Widget build(BuildContext context) {
    String idUser = FirebaseAuth.instance.currentUser.uid;
    CollectionReference user = FirebaseFirestore.instance.collection("discussions")
      .doc(idUser).collection(widget.contact.email);
      
    return Scaffold(
      body:Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:Column(
            children:[
              AppBarMessage(widget.contact),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: user.snapshots(),
                  builder: (context, snapshot)
                  {
                    if (snapshot.hasError) {
                      return Text("Some error");
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }
                    
                    if(snapshot.data.docs!=null)
                    {
                      print(widget.email);
                      print('ttttttttttttttttttttt');
                      for (var doc in snapshot.data.docChanges) {
                        print('ffffffffffffff'+doc.doc['emailSource']);
                        if(doc.doc['emailSource']==widget.email)
                          isMe=true;
                        else
                          isMe=false;
                        allMsg.add(Message.fromJson(doc.doc.data()));
                      }
                      return ListViewAllMsg(allMsg,isMe);
                    }
                    else 
                      return Text('');
                  }  
                ),
              ),
              BottomWidget(widget.contact.email),
            ]
          ),
        )
      )
    );
  }
}