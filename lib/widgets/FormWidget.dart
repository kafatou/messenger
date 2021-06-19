import 'package:messenger_project/Providers/LoginProviders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/TextFormFIeldWidget.dart';

class FormWidget extends StatelessWidget {

  TextEditingController textEditingControllerPren=new TextEditingController();
  TextEditingController textEditingControllerNom=new TextEditingController();
  TextEditingController textEditingControllerEmail=new TextEditingController();
  TextEditingController textEditingControllerPwd=new TextEditingController();
  TextEditingController textEditingControllerPwd1=new TextEditingController();

  String prenom,nom,email,mdp;

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProviders>(
      builder: (_, model, __) {
        return Form(
          key: model.keyForm,
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: Column(
              children: [
                SizedBox(height: 15,),
                TextFormFieldWidget("Entrer votre prenom", Icon(Icons.person),textEditingControllerPren,
                      (value){
                    if(textEditingControllerPren.text.isEmpty==false)
                    {
                      model.prenom=textEditingControllerPren.text;
                      return null;
                    }
                    else
                      return "Ce champ ne doit pas etre null";
                  },),
                SizedBox(height: 15,),
                TextFormFieldWidget("Entrer votre nom", Icon(Icons.person),textEditingControllerNom,
                      (value){
                    if(textEditingControllerNom.text.isEmpty ==false)
                    {
                      model.nom=textEditingControllerNom.text;
                      return null;
                    }
                    else
                      return "Ce champ ne doit pas etre null";
                  },),
                TextFormFieldWidget("entrer votre email",Icon(Icons.mail),textEditingControllerEmail,(value)
                {
                  if(textEditingControllerEmail.text.isEmpty ==false && textEditingControllerEmail.text.contains('@'))
                  {
                    model.email=textEditingControllerEmail.text;
                    return null;
                  }
                  else
                    return "Email not good";
                },),
                SizedBox(height: 15,),
                TextFormFieldWidget("entrer votre mot de passe",Icon(Icons.lock),textEditingControllerPwd,(value)
                {
                  if(textEditingControllerPwd.text.isEmpty ==false && value.length>6)
                  {
                    return null;
                  }
                  else
                    return 'password not valide';
                },
                ),
                SizedBox(height: 15,),
                TextFormFieldWidget("confirmer votre mot de passe",Icon(Icons.lock),textEditingControllerPwd1,(value)
                {
                  if(textEditingControllerPwd1.text!=textEditingControllerPwd.text)
                  {
                    return 'Error:password not valide';
                  }
                  mdp=textEditingControllerPwd1.text;
                  model.mdp=textEditingControllerPwd1.text;
                  return null;
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
