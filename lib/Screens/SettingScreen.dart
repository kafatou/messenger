import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_project/GeneratedRoutes.dart';
import 'package:messenger_project/Providers/profileProvider.dart';
import 'package:messenger_project/widgets/CircularImageUser.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var profil=Provider.of<ProfileProvider>(context,listen: false);
    return Container(
      decoration: BoxDecoration(color:(Colors.white),),
      child: Column(
        children:[
          Row(
            children: [
              //CircularImageUser(),
              Text("prenom"),
              Text("nom"),
            ],
            
          ),
          TextButton(onPressed: null, child: Row(
            children: [
              Icon(Icons.security),
              Text("Confidentialité")
            ],
          ),),
          TextButton(onPressed:()async {
            profil.isAuthentificated=false;
            await FirebaseAuth.instance.signOut();
            Navigator.pushNamed(context, GeneratedRoutes.connexion);
            },
            child: Row(
              children: [
                Icon(Icons.lock_outline),
                Text("Déconnexion")
              ],
          ),),  
        ]
      ),
    );
  }
}