

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:messenger_project/Models/message.dart';
import 'package:messenger_project/Providers/sendImgProvider.dart';
import 'package:messenger_project/utils/networking.dart';
import 'package:provider/provider.dart';

class BottomWidget extends StatelessWidget {
  String emailDest;
  BottomWidget(this.emailDest);
  TextEditingController controller=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    //var provider=Provider.of<SendImgProvider>(context,listen: false);
    return ChangeNotifierProvider(
      create: (context)=>SendImgProvider(),
      child:Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color :Colors.grey.withOpacity(0.1)
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: (MediaQuery.of(context).size.width)/5 ,
            child: Row(
              children: <Widget>[
                Icon(Icons.camera_alt, size: 22,color:Colors.lightBlue),
                SizedBox(width: 8,),
                Icon(Icons.keyboard_voice,size: 22,color: Colors.lightBlue,),
                SizedBox(width: 8,),
                Consumer<SendImgProvider>(
                  builder: (context,SendImgProvider sendImgProvider,_)
                  {
                    return IconButton(icon:Icon(Icons.image ,size: 22,color: Colors.lightBlue,),onPressed:(){
                      //sendImgProvider.email=emailDest;
                      sendImgProvider.getNewImage(emailDest);
                    } 
                    );
                    //Icon(Icons.image ,size: 22,color: Colors.lightBlue);
                })
                
              ],
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width)/1.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget>[
                Container(
                 width: (MediaQuery.of(context).size.width)/1.8,
                 height: 40,
                 decoration: BoxDecoration(
                   color: Colors.grey,
                   borderRadius: BorderRadius.circular(20)
                 ),
                 child: Padding(
                   padding: const EdgeInsets.only(left:12),
                   child: TextField(
                    decoration: InputDecoration(
                       border: InputBorder.none,
                       hintText: "Message",
                     ),
                    controller:controller ,
                   ),
                   ),
                ),
                SizedBox(width: 5,
                ),
                IconButton(icon: Icon(Icons.send , size: 22,color: Colors.lightBlue,),
                  onPressed: ()async{
                    if(controller.text.isEmpty==false )
                    {
                      String email=await recupEmail();
                      Message msg=new Message(email,controller.text,false);
                      int i=await Networking.uploadDataSms(msg,emailDest);
                      if(i==1)
                        controller.clear();       
                    }
                  }
                )
              ],
            ),
          ),
        ],
      )
    ),
    );
  }

  Future<String> recupEmail() async
  {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user=auth.currentUser;
    String id=user.uid;
    QuerySnapshot snapshot =await FirebaseFirestore.instance.collection('users').get();
    
    for(var a in snapshot.docs)
    {
      if(a['userId']==id)
        return a['email'];
    }
    return 'null';
  }
}