import 'package:flutter/material.dart';
import 'package:messenger_project/Providers/authenProvider.dart';
import 'package:messenger_project/Providers/profileProvider.dart';
import 'package:messenger_project/generatedRoutes.dart';
import 'package:messenger_project/utils/networking.dart';
import 'package:provider/provider.dart';

class AuthenButton extends StatefulWidget {
  @override
  _AuthenButtonState createState() => _AuthenButtonState();
}

class _AuthenButtonState extends State<AuthenButton> 
  with TickerProviderStateMixin
{
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
    var profil=Provider.of<ProfileProvider>(context,listen: false);
    return Consumer<AuthenProvider>(
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
                  int i=await Networking.connexion(model.email, model.mdp);
                  if(i==1)
                  {
                    profil.isAuthentificated=true;
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
                        "Se connecter",
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