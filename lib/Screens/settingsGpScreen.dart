import 'package:flutter/material.dart';

class SettingsGpScreen extends StatefulWidget {
  @override
  _SettingsGpScreenState createState() => _SettingsGpScreenState();
}

class _SettingsGpScreenState extends State<SettingsGpScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:[
          GestureDetector(
            onTap: null,
            child: CircleAvatar(
              backgroundImage:null ,
              radius:100
            ),
          ),
          Row(
            children:[
              Text("Nom"),
              IconButton(icon: Icon(Icons.edit),onPressed: null,),
            ]
          ),
          //liste des mbres
          TextButton(onPressed: null, child: Text("Quitter le groupe")),
        ]
      ),
      
    );
  }
}