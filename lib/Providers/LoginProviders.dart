import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class LoginProviders extends ChangeNotifier {
  PickedFile file;
  String email,mdp,prenom,nom;
  ImagePicker imagePicker = new ImagePicker();
  GlobalKey<FormState> keyForm = new GlobalKey<FormState>();

  getNewImage() async {
    file = await imagePicker.getImage(source: ImageSource.gallery);

    notifyListeners();
  }
}
