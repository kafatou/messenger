import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_project/GeneratedRoutes.dart';
import 'package:messenger_project/Models/Contact.dart';
import 'package:messenger_project/widgets/listeContact.dart';

class EditScreen extends StatelessWidget {
  List<Contact> allContact=new List();
  String email;
  String id = FirebaseAuth.instance.currentUser.uid;
    CollectionReference user = FirebaseFirestore.instance.collection("users");

    EditScreen(this.email);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children:[
              Padding(
                padding: const EdgeInsets.only(top:18.0,left: 8.0, right: 8.0),
                  child: Row(
                  children: [
                    IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
                      Navigator.pushNamed(context, GeneratedRoutes.home,arguments: email);
                    }),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,left: 8.0, right: 8.0),
                      child: Text("Nouveau message",style: TextStyle(fontSize: 25),),
                    ),
                  ],),
              ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0,left: 10.0, right: 10.0),
                  child: Row(
                    children: [
                      Icon(Icons.group),
                      TextButton(onPressed:(){
                        Navigator.pushNamed(context, GeneratedRoutes.group);
                      }, child: Text("Créer un nouveau groupe"),)  
                    ],
              ),
                ),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 10.0, right: 10.0),
                    child: Row(
                    children: [
                      Icon(Icons.videocam),
                      TextButton(onPressed: null, child: Text("Discutez en vidéo avec qui vous voulez")),
                    ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 10.0, right: 10.0),
                    child: Row(
                    children: [
                      Icon(Icons.video_call),
                      TextButton(onPressed: null, child: Text("Créer un nouveau salon")),
                    ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("suggestions")),
              //liste contacts...
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
                        //print(doc.doc['userId']);
                        //print(id);
                        if(doc.doc['userId']==id)
                          continue;
                          allContact.add(Contact.fromJson(doc.doc.data()));
                      }
                    }  
                    return ListeContacts(allContact,email);     
                }) // voir definition
              )
            ]
          ),
        ),
      ),
    );
  }
}