import 'package:flutter/material.dart';
import 'package:messenger_project/Providers/researchProvider.dart';
import 'package:provider/provider.dart';


class CustomTextField extends StatelessWidget {
  //TextEditingController controller=new TextEditingController();
  //CustomTextField(this.controller);
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<ResearchProvider>(context,listen: false);
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(25)),
        child:TextField(
          cursorColor: Colors.black.withOpacity(0.2),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            hintText: "Search", 
            border: InputBorder.none
          ),
          controller: provider.controller,
          onTap:(){
            provider.isChange();
          } ,
          
          /*onChanged:(value)
          {
            if(value!=null)
            {

              return;
            }
              
          },*/
        ),
      );
    
  }
}