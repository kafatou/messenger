import 'package:messenger_project/GeneratedRoutes.dart';
import 'package:flutter/material.dart';
import 'package:messenger_project/Providers/profileProvider.dart';
import 'package:provider/provider.dart';
class APP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>ProfileProvider(),
      child:MaterialApp(
        initialRoute: GeneratedRoutes.splash,
        onGenerateRoute: GeneratedRoutes.onGeneratedRoute
      )
    );
  }
}