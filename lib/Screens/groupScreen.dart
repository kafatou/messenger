import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_project/GeneratedRoutes.dart';
import 'package:messenger_project/Models/Contact.dart';
import 'package:messenger_project/Models/gpArguments.dart';
import 'package:messenger_project/widgets/CustomTextField.dart';
import 'package:messenger_project/widgets/listAllContactGroup.dart';

class GroupScreen extends StatefulWidget {
  String email;

  GroupScreen(this.email);
  @override
  _GroupScreenState createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  String id = FirebaseAuth.instance.currentUser.uid;
  CollectionReference user = FirebaseFirestore.instance.collection("users");
  List<Contact> allContact = [];
  List<Contact> allContactAjout = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children:[
            Padding(
              padding: const EdgeInsets.only(top:18.0,left: 8.0, right: 8.0),
                child: Row(
                children: [
                  IconButton(icon: Icon(Icons.arrow_back), onPressed:(){
                    Navigator.pushNamed(context, GeneratedRoutes.edit,arguments: widget.email);
                  } ),
                  Text("Ajouter des participants",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  TextButton(
                    onPressed:(){
                      if(allContactAjout.length!=1)
                      {
                        GpArguments gpArguments=new GpArguments(allContactAjout, widget.email);
                        Navigator.pushNamed(context, GeneratedRoutes.newGp,arguments: gpArguments);
                      }
                    }, 
                    child: Text("SUIVANT"),
                  ),
                ],),
            ),
              //CustomTextField(controller),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: user.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Some error");
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }                       
                    if(snapshot.data!=null)
                    {
                      for (var doc in snapshot.data.docChanges) {
                        if(doc.doc['userId']==id)
                        {
                          allContactAjout.add(Contact.fromJson(doc.doc.data()));
                          continue;
                        }  
                          allContact.add(Contact.fromJson(doc.doc.data()));
                      }
                    } 
                    return ListViewAllContactGroup(allContact,allContactAjout);     
                }) // voir definition
              )
          ]
        ),
      ),
    );
  }
}