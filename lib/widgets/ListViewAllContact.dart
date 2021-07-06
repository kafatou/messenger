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
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, GeneratedRoutes.conversation,arguments: ScreenArguments(allContact[index],email));
          },
          child: OneRowContactMessage(allContact[index]));
        },
      itemCount: allContact.length,
      );
  }
}
