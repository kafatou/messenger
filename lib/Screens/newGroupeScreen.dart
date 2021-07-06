

import 'package:flutter/material.dart';
import 'package:messenger_project/GeneratedRoutes.dart';
import 'package:messenger_project/Models/Contact.dart';
import 'package:messenger_project/Models/gpArguments.dart';
import 'package:messenger_project/Models/gppArguments.dart';
import 'package:messenger_project/Models/groupe.dart';
import 'package:messenger_project/Providers/contactSelectedProvider.dart';
import 'package:messenger_project/utils/networking.dart';
import 'package:messenger_project/widgets/listeContact.dart';
import 'package:messenger_project/widgets/listeContactsGp.dart';
import 'package:provider/provider.dart';

class NewGroupeScreen extends StatefulWidget {
  //List<Contact> allContactAjout;
  GpArguments gpArguments;
  NewGroupeScreen(this.gpArguments);
  @override
  _NewGroupeScreenState createState() => _NewGroupeScreenState();
}
class _NewGroupeScreenState extends State<NewGroupeScreen> {
  TextEditingController textEditingController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    //var provider=Provider.of<ContactSelectedProvider>(context,listen:false);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:18.0,left: 8.0, right: 8.0),
            child: Row(
              children: [
                IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
                  Navigator.pushNamed(context, GeneratedRoutes.group,arguments: widget.gpArguments.email);
                }),
                Text("Nouveau groupe",style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                TextButton(onPressed: () async{
                  //if(widget.allContactAjout.length!=0)
                  //{
                    if(textEditingController.text.isEmpty==false)
                    {
                      Groupe groupe=new Groupe(textEditingController.text,widget.gpArguments.list);

                      int i=await Networking.saveGPToDataBase(groupe);
                      GppArguments gppArguments=new GppArguments(textEditingController.text, widget.gpArguments.email, widget.gpArguments.list);
                      if(i==1)  
                        Navigator.pushNamed(context, GeneratedRoutes.gpDisc,arguments: gppArguments);
                    }
                  //}       
                }, child: Text("CREER",style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),),
              ],
            ),
          ),
          SizedBox(height: 15,),
          Column(
            children:[
              SizedBox(height: 15,),
              Text("Nommez votre nouvelle discussion"),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 8.0, right: 8.0),
                child: TextField(
                  cursorColor: Colors.black.withOpacity(0.2),
                  decoration: InputDecoration(
                    hintText: "Nom du groupe (obligatoire)", 
                    border: InputBorder.none
                  ),
                  controller: textEditingController,
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(widget.gpArguments.list.length.toString()+" participant(s)")),
            ]
          ),
          SizedBox(height: 15,),
          Expanded(child: ListeContactsGp(widget.gpArguments.list),),          
        ],
      ),
    );
  }
}