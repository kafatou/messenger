import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:messenger_project/utils/networking.dart';
import 'package:provider/provider.dart';

class SendImgProvider extends ChangeNotifier
{
  PickedFile pickedFile;
  //String email;
  ImagePicker imagePicker = new ImagePicker();

  getNewImage(String email) async {
    pickedFile = await imagePicker.getImage(source: ImageSource.gallery);

    File file=File(pickedFile.path);

    int i=await Networking.sendImgMsg(file, email);

    if(i==1)
      print("ok");

    notifyListeners();
  }
}