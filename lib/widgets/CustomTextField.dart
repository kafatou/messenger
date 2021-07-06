import 'package:flutter/material.dart';
import 'package:messenger_project/GeneratedRoutes.dart';
import 'package:messenger_project/Providers/researchProvider.dart';
import 'package:provider/provider.dart';


class CustomTextField extends StatelessWidget {
  TextEditingController controller=new TextEditingController();
  //CustomTextField(this.controller);
  static int nbre=0;
  String email;

  CustomTextField(this.email);
  @override
  Widget build(BuildContext context) {
    //var provider=Provider.of<ResearchProvider>(context,listen: false);
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
        controller: controller,
        onTap:(){
          if(controller!=null)
            Navigator.pushNamed(context, GeneratedRoutes.search,arguments: email);
        },
      ),
    );  
  }
}