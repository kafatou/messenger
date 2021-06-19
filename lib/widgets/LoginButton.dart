
import 'dart:io';

import 'package:messenger_project/Models/user.dart';
import 'package:messenger_project/Providers/LoginProviders.dart';
import 'package:messenger_project/Screens/LoginScreen.dart';
import 'package:messenger_project/utils/networking.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../GeneratedRoutes.dart';


class LoginButton extends StatefulWidget {
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation button;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    button = new Tween(begin: 320.0, end: 70.0).animate(new CurvedAnimation(
        parent: animationController, curve: new Interval(0.0, 0.250)));
  }

  @override
  Widget build(BuildContext context) {
    String url="null";
    Userrr user;
    print(animationController.value);
    return Consumer<LoginProviders>(
      builder: (_, model, __) {
        return AnimatedBuilder(
          animation: animationController,
          builder: (context, widget) {
            return GestureDetector(
              onTap: () async {
                animationController.forward();
                print(model.keyForm.currentState.validate().toString());
                if(model.keyForm.currentState.validate())
                {
                  print("inscription");
                  int result=await Networking.inscription(model.email, model.mdp);
                  if(result==1)
                  {
                    if(model.file.path!=null)
                    {
                      File myfile=File(model.file.path);
                      print("uploadfile");
                      url=await Networking.upLoadFile(myfile);
                    }
                    else  
                      url='pas de photo';
                    user=new Userrr(model.nom, model.prenom, model.email, model.mdp,url);
                    
                    print("saveUser");
                    int k=await Networking.saveUserToDataBase(user);
                    if(k==1)
                      Navigator.pushNamed(context, GeneratedRoutes.home,arguments: model.email);
                  }
                }
              },
              child: Container(
                width: button.value,
                height: 40,
                alignment: FractionalOffset.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.blue),
                child: button.value > 70
                    ? Text(
                        "S'inscrire",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      )),
              ),
            );
          },
        );
      },
    );
  }

}
