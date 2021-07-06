

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_project/GeneratedRoutes.dart';
import 'package:messenger_project/Models/Contact.dart';
import 'package:messenger_project/Providers/researchProvider.dart';
import 'package:messenger_project/widgets/CustomTextField.dart';
import 'package:messenger_project/widgets/listeContact.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  String email;

  SearchScreen(this.email);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Contact> allContact = [];
  List<Contact> allContactResearch = [];
  String id = FirebaseAuth.instance.currentUser.uid;
    CollectionReference user = FirebaseFirestore.instance.collection("users");
  @override
  Widget build(BuildContext context) {
    print("objectttttttttttttttttttttttttt");
    return ChangeNotifierProvider(
      create:(context)=> ResearchProvider(),
      child:Scaffold(
      body: Container(
        child: Column(
          children:[
            Row(
              children: [
                //CustomTextField(widget.email),
                TextButton(
                  onPressed:(){
                    Navigator.pushNamed(context, GeneratedRoutes.home);
                  },
                 child: Text("Annuler")
                ),
              ],
            ),
            // Consumer<ResearchProvider>(
            //   builder:(context,researchProvider,child)
            //   {
            //     return Expanded(
            //       child: StreamBuilder<QuerySnapshot>(
            //         stream: user.snapshots(),
            //         builder: (context, snapshot) {
            //           if (snapshot.hasError) {
            //             return Text("Some error");
            //           }
            //           if (snapshot.connectionState == ConnectionState.waiting) {
            //             return Text("Loading");
            //           }                       
            //           if(snapshot.data!=null)
            //           {
            //             for (var doc in snapshot.data.docChanges) {
            //               print(doc.doc['userId']);
            //               print(id);
            //               if(doc.doc['userId']==id)
            //                 continue;
            //               allContact.add(Contact.fromJson(doc.doc.data()));
            //             }
            //           }  
            //           if(researchProvider.controller!=null)
            //           {
            //             allContactResearch.clear();
            //             for(var a in allContact)
            //             {
            //               if(a.prenom.contains(researchProvider.controller.text) || a.nom.contains(researchProvider.controller.text))
            //               {
            //                 allContactResearch.add(a);
            //               }
            //             }                            
            //           }
            //           return ListeContacts(allContactResearch, widget.email);  //////////////********* */   
            //         }) // voir definition
            //     );
            //   }
            // ) 
            //
          ]
        ),
      ),
    )
    );
  }
}