import 'package:flutter/material.dart';
import 'package:messenger_project/Models/Contact.dart';
import 'package:messenger_project/widgets/oneRowContactSelected.dart';

class ListViewAllContactGroup extends StatelessWidget {
  List<Contact> allContact;
  List<Contact> allContactAjout;
  ListViewAllContactGroup(this.allContact,this.allContactAjout);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return OneRowContactSelected(allContact[index],allContactAjout);
      },
      itemCount: allContact.length,
      );
  }
}