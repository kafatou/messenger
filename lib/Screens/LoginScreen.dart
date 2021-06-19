import 'dart:io';

import 'package:messenger_project/Providers/LoginProviders.dart';
import 'package:messenger_project/widgets/FormWidget.dart';
import 'package:messenger_project/widgets/ImagePickerWidget.dart';
import 'package:messenger_project/widgets/LoginButton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  String Mnemail;
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProviders(),
      child: Scaffold(
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
          child: ListView(
            children: [
              ImagePIckerWiget(),
              FormWidget(),
              LoginButton()
            ],
          ),
        ),
      ),
    );
  }
}
