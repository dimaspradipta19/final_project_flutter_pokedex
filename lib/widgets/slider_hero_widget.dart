import 'package:flutter/material.dart';

import '../utils/styles_guide.dart';

class SliderHeroWidget extends StatelessWidget {
  const SliderHeroWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.13,
      // width: MediaQuery.of(context).size.width * 0.88,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                    child: Text(
                      "POKEMON ${index + 1}",
                      style: myTextTheme.labelLarge?.copyWith(
                          color: whiteColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Positioned(
                    right: 0,
                    child: Image.asset(
                      "assets/images/pokemon_together.png",
                      width: 216,
                      height: 100,
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
