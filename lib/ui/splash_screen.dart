import 'package:final_projects_pokemon/utils/styles_guide.dart';
import 'package:flutter/material.dart';

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
                  Image.asset(
                    "assets/images/pokemon_logo.png",
                    width: 90.0,
                    height: 90.0,
                  ),
                  const SizedBox(height: 20.0),
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

class VersionWidget extends StatelessWidget {
  const VersionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      bottom: 40.0,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          "Versi 4.3.3",
          style: TextStyle(
              color: whiteColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
