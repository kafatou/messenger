import 'package:flutter/material.dart';
import 'package:messenger_project/GeneratedRoutes.dart';
import 'package:messenger_project/Models/Contact.dart';
import 'package:messenger_project/Models/screenArguments.dart';
import 'package:messenger_project/widgets/CircularImageUser.dart';

class ListeContacts extends StatelessWidget {
  List<Contact> list=new List();
  String email;
  ListeContacts(this.list,this.email);

  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context,int index)
      {
        return GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, GeneratedRoutes.conversation,arguments: ScreenArguments(list[index],email));
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: list[index].urlImage!='pas de photo'
                  ?CircularImageUser(
                    urlImage:list[index].urlImage,
                    radius: 60)
                  :CircleAvatar(
                    child:Icon(Icons.person),
                      radius: 60),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:[
                        Text(
                          list[index].prenom,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          list[index].nom,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),  
                    
                  ],
                )
              ],
            ),
          ),
        );
      },
      itemCount: list.length,
    );
  }
}