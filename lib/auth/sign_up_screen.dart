import 'package:flutter/material.dart';
import 'package:quize_app/res/constants/images_paths.dart';
import 'package:quize_app/res/constants/widget_styles.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [
            Center(
              child: Text(
                "User Name",
                style: WidgetStyle.appBarStyle,
              ),
            ),
            SizedBox(width: 15),
          ],
          elevation: 10,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: WidgetStyle.secondaryColor,
          child: Image.asset(
            ImagePaths.backgroundImage,
          ),
        ));
  }
}
