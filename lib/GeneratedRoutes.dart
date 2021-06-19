import 'package:messenger_project/Models/Contact.dart';
import 'package:messenger_project/Models/screenArguments.dart';
import 'package:messenger_project/Screens/ConversationScreen.dart';
import 'package:messenger_project/Screens/HomeMessage.dart';
import 'package:messenger_project/Screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:messenger_project/Screens/SettingScreen.dart';
import 'package:messenger_project/Screens/connexion.dart';
import 'package:messenger_project/Screens/groupScreen.dart';
import 'package:messenger_project/Screens/splashScreen.dart';
import 'package:messenger_project/widgets/BottomWidget.dart';

class GeneratedRoutes {
  
  static const String home = "/home";

  static const String loginScreen = "/loginscreen";

  static const String conversation="/conversation";

  static const String splash="/";

  static const String connexion="/connexion";

  static const String deconnexion="/deconnexion";

  static const String setting="/setting";

  static const String group="/group";

  //final String detailsScreen = "/detailScreen";

  static Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case splash:
        return MaterialPageRoute(builder: (context) => MySplash());
      case home:
      {
        String email=settings.arguments;
        return MaterialPageRoute(builder: (context) => HomeMessage(email));
      }
        
      case conversation:
      {

        print('lllllllllllllllll');
        //Contact contact=Contact.fromJson(settings.arguments);
        //String email="fatou@gmail.com";

        final args=settings.arguments as ScreenArguments;

        print('mmmmmmmmmmmmmmmmmmmmmmm');

        //print('==================kkkkkk'+contact.email);
        //print('k=====================kkkkk'+email);

        return MaterialPageRoute(builder: (context) => ConversationScreen(args.contact,args.email));

      }
        
      case connexion:
        return MaterialPageRoute(builder: (context) => Connexion());
      
      case setting:
        return MaterialPageRoute(builder: (context) => SettingScreen());

      case deconnexion:
        return MaterialPageRoute(builder: (context) => Connexion());

      case group:
        return MaterialPageRoute(builder: (context) => GroupScreen());

      default:
        return MaterialPageRoute(builder: (context) => null);
    }
  }
}
