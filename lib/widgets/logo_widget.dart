import 'package:flutter/cupertino.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0, bottom: 12.0),
      child: Center(
        child: Image.asset(
          "assets/images/pokemon_logo.png",
          width: 120,
        ),
      ),
    );
  }
}
