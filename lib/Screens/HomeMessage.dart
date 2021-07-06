import 'package:firebase_auth/firebase_auth.dart';
import 'package:messenger_project/GeneratedRoutes.dart';
import 'package:messenger_project/Models/Contact.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messenger_project/Providers/allContactProvider.dart';
import 'package:messenger_project/Providers/researchProvider.dart';
import 'package:messenger_project/widgets/AppBarMessenger.dart';
import 'package:messenger_project/widgets/CustomTextField.dart';
import 'package:messenger_project/widgets/ListViewAllContact.dart';
import 'package:provider/provider.dart';

class HomeMessage extends StatefulWidget {
  String email;

  HomeMessage(this.email);
  @override
  _HomeMessageState createState() => _HomeMessageState();
}

class _HomeMessageState extends State<HomeMessage> {
  @override 
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    //TextEditingController controller;
    List<Contact> allContact = [];
    String id = FirebaseAuth.instance.currentUser.uid;
    CollectionReference user = FirebaseFirestore.instance.collection("users");

    print('envoiiiiiiiiiiiiiii');
    print(widget.email);
    return ChangeNotifierProvider(
      create:(context)=>AllContactProvider(), 
      child:Consumer(builder: (context,AllContactProvider provider,child)
      {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail),
              label: "Contacts",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Messages",
            )
          ],
          currentIndex: provider.selectItem,
          selectedItemColor: Colors.blue,
          onTap: (index) {
            allContact.clear();
            provider.changeItem(index);
          },
          ),
          body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AppBarMessenger(widget.email),
              SizedBox(
                height: 10,
              ),
              CustomTextField(widget.email), // voir definition
              SizedBox(
                height: 30,
              ),
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
                          continue;
                        allContact.add(Contact.fromJson(doc.doc.data()));
                      }
                    }  
                    return ListViewAllContact(allContact,widget.email);     
                  }
                ) // voir definition
              )
            ]
            ),
          )
        );
      })
    );

  }
}
