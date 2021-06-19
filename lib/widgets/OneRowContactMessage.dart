import 'package:messenger_project/Models/Contact.dart';
import 'package:flutter/material.dart';
import 'package:messenger_project/Providers/allContactProvider.dart';
import 'package:messenger_project/widgets/CircularImageUser.dart';
import 'package:provider/provider.dart';

class OneRowContactMessage extends StatelessWidget {
  Contact contact;
  OneRowContactMessage(this.contact);
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AllContactProvider>(context,listen:false);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
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
              Row(
                children:[
                  Text(
                    contact.prenom,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    contact.nom,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),  
              provider.selectItem==0
                ?Container(
                  width: MediaQuery.of(context).size.width - 115,
                  child: Text(
                    contact.statut,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                )
                :Text('')
            ],
          )
        ],
      ),
    );
  }
}
