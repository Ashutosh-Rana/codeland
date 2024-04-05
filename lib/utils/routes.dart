import 'package:codeland/screens/image_upload_screen.dart';
import 'package:codeland/screens/login_screen.dart';
import 'package:codeland/utils/constants.dart';
import 'package:flutter/material.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case imageUploadRoute:
        return MaterialPageRoute(builder: (_) => ImageUploadScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}