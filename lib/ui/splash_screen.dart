import 'package:final_projects_pokemon/utils/styles_guide.dart';
import 'package:flutter/material.dart';

import '../widgets/version_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future delaySplashScreen(context) {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushNamedAndRemoveUntil(
            context, "/homescreen", (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    delaySplashScreen(context);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: yellowColor1),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Image.asset(
                      "assets/images/pokemon_logo.png",
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  const CircularProgressIndicator.adaptive(
                    backgroundColor: whiteColor,
                  )
                ],
              ),
            ),
            const VersionWidget(),
          ],
        ),
      ),
    );
  }
}
