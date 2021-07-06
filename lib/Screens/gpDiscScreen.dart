import 'package:flutter/material.dart';
import 'package:messenger_project/GeneratedRoutes.dart';
import 'package:messenger_project/Models/gppArguments.dart';
import 'package:messenger_project/widgets/BottomWidget.dart';

class GpDiscScreen extends StatefulWidget {
  GppArguments gppArguments;

  GpDiscScreen(this.gppArguments);
  @override
  _GpDiscScreenState createState() => _GpDiscScreenState();
}

class _GpDiscScreenState extends State<GpDiscScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( 
        child:Column (
          children: [
            Padding(
              padding: const EdgeInsets.only(top:18.0,left: 8.0, right: 8.0),
              child: Row(
                children: [
                  IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
                    Navigator.pushNamed(context, GeneratedRoutes.home,arguments: widget.gppArguments.email);
                  }),
                  //image
                  TextButton(
                    child:Row(
                      children:[
                        Image.network(null),
                        Text(widget.gppArguments.nom,style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                      ]
                    ),
                    onPressed: null,)
                ],
                ),
            ),              
            BottomWidget(null),
          ],       
        ),
      ) 
    );
  }
}