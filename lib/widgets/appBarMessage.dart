import 'package:flutter/material.dart';
import 'package:messenger_project/Models/Contact.dart';
import 'package:messenger_project/utils/networking.dart';
import 'package:messenger_project/widgets/CircularImageUser.dart';

class AppBarMessage extends StatelessWidget {
  Contact contact;
  AppBarMessage(this.contact);
  @override
  Widget build(BuildContext context) {
    print('iciiiiiiiiiiiii');
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color :Colors.grey.withOpacity(0.1)
      ),
      child:Padding(
      padding: const EdgeInsets.only(top:8.0,left: 5.0, right: 8.0),
      child: Row(  
        children: [
          IconButton(icon: Icon(Icons.arrow_back), onPressed: null),
          Padding(
            padding: const EdgeInsets.only(left: 18.0,right: 30.0),
            child: contact.urlImage!='pas de photo'
            ?CircularImageUser(
                urlImage:
                    contact.urlImage,
                radius: 60)
            :CircleAvatar(
               child:Icon(Icons.person),
                radius: 60),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:18.0,left: 8.0,right: 20.0),
                child: Row(
                  children:[
                    Text(
                      contact.prenom,
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      contact.nom,
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),  
            ],
          ),
          //IconButton(icon: Icon(Icons.call), onPressed: null),
          //IconButton(icon: Icon(Icons.videocam), onPressed: null),
        ],
      ),
     )
    );
  }
}