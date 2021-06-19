import 'package:messenger_project/Models/Contact.dart';
import 'package:flutter/material.dart';
import 'package:messenger_project/Models/screenArguments.dart';
import 'package:messenger_project/Providers/allContactProvider.dart';
import 'package:messenger_project/Providers/researchProvider.dart';
import 'package:messenger_project/generatedRoutes.dart';
import 'package:provider/provider.dart';

import 'OneRowContactMessage.dart';

class ListViewAllContact extends StatelessWidget {
  List<Contact> allContact;
  String email;

  

  List<dynamic> list=new List();
  

  ListViewAllContact(this.allContact,this.email);
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<ResearchProvider>(context,listen: false);
    provider.controller.clear();
    print(email);
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            //list.add(Contact.fromJson([index]));
            //Contact contact=new Contact(email, null, null, null);
            //list.add(email);
            //print(allContact[index].email);
            //print('kkkkkkfirst'+list.first.email);
            //print('kkkkkk'+list.last);
            Navigator.pushNamed(context, GeneratedRoutes.conversation,arguments: ScreenArguments(allContact[index],email));
          },
          child: OneRowContactMessage(allContact[index]));
        },
      itemCount: allContact.length,
      );
  }
}
