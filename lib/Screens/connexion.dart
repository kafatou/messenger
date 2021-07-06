import 'package:flutter/material.dart';
import 'package:messenger_project/Providers/authenProvider.dart';
import 'package:messenger_project/generatedRoutes.dart';
import 'package:messenger_project/widgets/FormWidgetAuthen.dart';
import 'package:messenger_project/widgets/authenButton.dart';
import 'package:provider/provider.dart';

class Connexion extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>AuthenProvider(),
      child:Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Messenger",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child:ListView(
            children: [
              FormWidgetAuthen(),
              AuthenButton(),
              TextButton(
                child: Text("S'inscrire",style: TextStyle(fontSize:20,color: Colors.blue),),
                onPressed: (){
                  Navigator.pushNamed(context, GeneratedRoutes.loginScreen);
                },
              )
            ],
          )
        ) 
      )    
    );
  }
}