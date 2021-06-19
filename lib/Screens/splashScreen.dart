import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_project/Providers/profileProvider.dart';
import 'package:messenger_project/Screens/HomeMessage.dart';
import 'package:messenger_project/Screens/connexion.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //String id=FirebaseAuth.instance.currentUser.uid;
    String email;
    recupEmail().then((value) => email);
    
    return Consumer<ProfileProvider>(
      builder:(context,ProfileProvider profil,child)
      {
        return SplashScreen(
          seconds: 5,  
          navigateAfterSeconds:profil.isAuthentificated?new HomeMessage(email):new Connexion(),  
          backgroundColor: Colors.white,  
          title: new Text('Messenger',textScaleFactor: 2,),  
          image: new Image.//asset('image/images.png'),
            network(  
                'https://www.google.com/search?q=image+for+splash+screen+app+messenger&rlz=1C1RLNS_frSN943SN943&sxsrf=ALeKk02UjeiULcqmG3_N7wymqUxK0052YQ:1621442364813&source=lnms&tbm=isch&sa=X&ved=2ahUKEwi3obbBl9bwAhXpXRUIHUAUAFgQ_AUoAXoECAEQAw&biw=1366&bih=625#imgrc=BA3p91bofZDHgM&imgdii=aQBmsRkp_Xnq4M'  
            ),  
          loadingText: Text("Loading"),  
          photoSize: 150.0,  
          loaderColor: Colors.blue,
        );
      }
    );
    
  }

  Future<String> recupEmail() async
  {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user=auth.currentUser;
    String id=user.uid;
    //print(id);
    QuerySnapshot snapshot =await FirebaseFirestore.instance.collection('users').get();
    
    for(var a in snapshot.docs)
    {
      //print(a['userId']);
      print(a['email']);
      if(a['userId']==id)
        return a['email'];
    }

    return 'null';
     
  }
}