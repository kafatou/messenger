import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:messenger_project/Models/groupe.dart';
import 'package:messenger_project/Models/message.dart';
import 'package:messenger_project/Models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';


class Networking
{
  static int n=0;
  static int dis=0;
  static int msg=0;
  ////Inscription
  static Future<int> inscription(String email,String mdp) async
  {

    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential user;

    try {
      print(email+mdp);
      user= await auth.createUserWithEmailAndPassword(
          email: email,password: mdp);
      print(user);
    }
    catch (e)
    {
      print(e.toString());
    }

    if(user == null)
      return 0;
    else
      return 1;

  }

  //Authentification
  static Future<int> connexion(String email,String mdp) async
  {
    UserCredential userCredential;
    try {
      userCredential= await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,password: mdp);
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

    if(userCredential!=null)
      return 1;
  }

  ///save image to firebase
  static Future<String> upLoadFile(File file) async
  {
    String downloadUrl;

    print(file.path);
    FirebaseStorage storage =FirebaseStorage.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    User user=auth.currentUser;
    String id=user.uid;
    try
    {
      //print('identifiant'+id);
      TaskSnapshot snapshot=await storage.ref().child("images/"+id).putFile(file);
      //print('mmmmmmmmmmmmmmmmmm');

      if (snapshot.state == TaskState.success)
      {
        downloadUrl = await snapshot.ref.getDownloadURL();
      }
    }
    catch (e){}

    return downloadUrl;
  }

  static Future<int> sendImgMsg(File file,String emailDest) async
  {
    String downloadUrl;
    FirebaseStorage storage =FirebaseStorage.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    User user=auth.currentUser;
    String id=user.uid;
    try
    {
      TaskSnapshot snapshot=await storage.ref().child("images/"+id+"imagesSend").putFile(file);
      if (snapshot.state == TaskState.success)
      {
        downloadUrl = await snapshot.ref.getDownloadURL();
      }
    }
    catch (e){}

    //
    //return downloadUrl;

    String email=await recupEmail();



    Message message=new Message(email, downloadUrl,true);

    int i=await uploadDataSms(message, emailDest);

    return i;
  }

  static Future<int> saveUserToDataBase(Userrr user) async
  {
    String id = FirebaseAuth.instance.currentUser.uid;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    DocumentReference ref=await users.add({
      'userId':id,
      'prenom': user.prenomUser,
      'nom': user.nomUser,
      'email': user.emailUser,
      'urlImg': user.urlImg
    });

    if(ref==null)
      return 0;
    else
      return 1;
  }

  static Future<int> saveGPToDataBase(Groupe groupe) async
  {
    //String id = FirebaseAuth.instance.currentUser.uid;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    DocumentReference ref=await users.add({
      //'userId':id,
      //'prenom': user.prenomUser,
      'nom': groupe.nom,
      //'email': user.emailUser,
      //'urlImg': groupe.urlImg
    });

    if(ref==null)
      return 0;
    else
      return 1;
  }

  static Future<int> uploadDataSmsGp(Groupe groupe,Message message) async
  {
     DocumentReference ref;
    //String id = FirebaseAuth.instance.currentUser.uid;
    CollectionReference documents = FirebaseFirestore.instance.collection('discussions')
    .doc("groupes").collection(groupe.nom);
    
    try{
      ref=await documents.add({
        'emailSource':message.email,
        'message':message.message,
        'isImg':message.isImg,
      });
    }
    catch(e)
    {
      print(e.toString());
    }

    if(ref==null)
      return 0;
    else
      return 1;
  }


  static Future<int> uploadDataSms(Message message,String emailDest) async
  { int m=n++;
    print(m.toString());
    DocumentReference ref;
    String id = FirebaseAuth.instance.currentUser.uid;
    CollectionReference documents;
    
    
    bool isExist=await isExistId(emailDest);

    if(isExist)
    {
      String idSource=await recupID(emailDest);

      documents=FirebaseFirestore.instance.collection('discussions')
      .doc(idSource).collection(message.email);
      
    }
    else
    {
      documents=FirebaseFirestore.instance.collection('discussions')
      .doc(id).collection(emailDest);
    }  
    
    try{
      ref=await documents.add({
        'emailSource':message.email,
        'message':message.message,
        'isImg':message.isImg
      });
    }
    catch(e)
    {
      print(e.toString());
    }
    print(ref.toString());
    if(ref==null)
      return 0;
    else
      return 1;

  }

  static Future<bool> isExistDisc(String emailDest) async
  {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user=auth.currentUser;
    String id=user.uid;

    /*String email;

    QuerySnapshot snapshot =await FirebaseFirestore.instance.collection('users').get();
    
    for(var a in snapshot.docs)
    {
      if(a['userId']==id)
      {
        
        email=a['email'];
        print(email);
      }
        
    }
    if(email==emailDest)
      return true;
    else
      return false;*/

    QuerySnapshot snapshot =await FirebaseFirestore.instance.collection('discussions')
      .doc(id).collection(emailDest).get();
    
    for(var a in snapshot.docs)
    {
      if(a!=null)
        return true;
    }
    return false;
  }

  static Future<String> recupID(String email) async
  {
    QuerySnapshot snapshot =await FirebaseFirestore.instance.collection('users').get();
    
    for(var a in snapshot.docs)
    {
      if(a['email']==email)
        return a['userId'];
    }
    return 'null';
  }

  static Future<bool> isExistId(String email) async
  {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user=auth.currentUser;
    String idS=user.uid;

    String id=await recupID(email);
    QuerySnapshot snapshot =await FirebaseFirestore.instance.collection('discussions').get();
    
    for(var a in snapshot.docs)
    {
      if(a.id==id)
      {
         for(var b in a.data().values)
        {
          if(b.id==idS)
            return true;
        }
      }
    }
    return false;
  }

  static Future<String> recupEmail() async
  {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user=auth.currentUser;
    String id=user.uid;

    String email;

    QuerySnapshot snapshot =await FirebaseFirestore.instance.collection('users').get();
    
    for(var a in snapshot.docs)
    {
      if(a['userId']==id)
      {
        email=a['email'];
        return email;
        //print(email);
      }   
    }
    return null;
  }
}