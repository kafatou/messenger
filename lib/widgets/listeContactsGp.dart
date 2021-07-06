import 'package:flutter/material.dart';
import 'package:messenger_project/Models/Contact.dart';
import 'package:messenger_project/widgets/CircularImageUser.dart';

class ListeContactsGp extends StatelessWidget {
  List<Contact> list=new List();

  ListeContactsGp(this.list);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,int index)
      {
        return Padding(
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
        );
      },
      itemCount: list.length,
      
    );
    
  }
}