import 'package:flutter/material.dart';
import 'package:quize_app/home/components/custom_button.dart';
import 'package:quize_app/res/constants/constant.dart';
import 'package:quize_app/res/constants/images_paths.dart';
import 'package:quize_app/res/constants/widget_styles.dart';

import 'add_questions_screen.dart';
import 'play_quize_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.homeTitle),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagePaths.backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  ImagePaths.logo,
                  width: 100,
                  height: 100,
                ),
                Text(
                  Constants.appName,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: WidgetStyle.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                const SizedBox(height: 20),
                CustomButton(
                  text: "Add Questions",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddQuestionsScreen(),
                      ),
                    );
                  },
                ),
                CustomButton(
                  text: "Start Quiz",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PlayQuizeScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
