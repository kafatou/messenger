import 'package:flutter/material.dart';
import 'package:messenger_project/Models/Contact.dart';
import 'package:messenger_project/Providers/contactSelectedProvider.dart';
import 'package:messenger_project/widgets/CircularImageUser.dart';
import 'package:provider/provider.dart';

class OneRowContactSelected extends StatelessWidget {
  Contact contact;
  List<Contact> allContactAjout = [];
  OneRowContactSelected(this.contact,this.allContactAjout);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=> ContactSelectedProvider(),
      child:Padding(
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
                    //,
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: Consumer<ContactSelectedProvider>(
                        builder:(context,contactSelectedProvider,child)
                        {
                          return contactSelectedProvider.isSelected==false
                            ?IconButton(icon: Icon(Icons.radio_button_off), onPressed:(){
                              contactSelectedProvider.isSelected=true;
                              contactSelectedProvider.nbre++;
                              allContactAjout.add(contact);
                              contactSelectedProvider.select();

                            } )
                            :IconButton(icon: Icon(Icons.radio_button_on), onPressed: (){
                              contactSelectedProvider.isSelected=false;
                              contactSelectedProvider.nbre--;
                              allContactAjout.remove(contact);
                              contactSelectedProvider.select();
                            });
                          //Radio(groupValue: false,value:false, onChanged: null);
                        },),
                    )
                    ,
                  ],
                ),  
                
              ],
            )
          ],
        ),
      ),
    ); 
  }
}