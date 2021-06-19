import 'package:flutter/material.dart';
import 'package:messenger_project/Providers/authenProvider.dart';
import 'package:messenger_project/widgets/TextFormFIeldWidget.dart';
import 'package:provider/provider.dart';

class FormWidgetAuthen extends StatelessWidget {
  TextEditingController textEditingController=new TextEditingController();
  TextEditingController textEditingControllerr=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AuthenProvider>(context,listen: false);
    return Form(
      key: provider.keyForm,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        child:Column(
          children: [
            SizedBox(height: 15,),
            TextFormFieldWidget("Entrer votre email", Icon(Icons.mail), textEditingController, 
              (value){
                if(textEditingController.text.isEmpty==false && value.contains('@'))
                {
                  provider.email=textEditingController.text;
                  return null;
                }
                else
                  return "Email not good";
              }
            ),
            SizedBox(height: 15,),
            TextFormFieldWidget("entrer votre mot de passe",Icon(Icons.lock),textEditingControllerr,
              (value)
              {
                if(textEditingControllerr.text.isEmpty ==false && value.length>6)
                {
                  provider.mdp=textEditingControllerr.text;
                  return null;
                }
                else
                  return 'password not valide';
              },
            ),
            SizedBox(height: 15,),
          ],
        ),
      ),
      ); 
  }
}