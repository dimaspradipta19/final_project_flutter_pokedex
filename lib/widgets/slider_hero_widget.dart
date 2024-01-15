// import 'package:flutter/material.dart';

// import '../utils/styles_guide.dart';

// class SliderHeroWidget extends StatelessWidget {
//   const SliderHeroWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * 0.13,
//       // width: MediaQuery.of(context).size.width * 0.88,
//       child: PageView.builder(
//         physics: const BouncingScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Stack(
//               children: [
//                 Container(
//                   height: 100,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: const BoxDecoration(
//                     color: secondaryColor,
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(30.0),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 20.0, left: 10.0),
//                     child: Text(
//                       "POKEMON ${index + 1}",
//                       style: myTextTheme.labelLarge?.copyWith(
//                           color: whiteColor, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                     right: 0,
//                     child: Image.asset(
//                       "assets/images/pokemon_together.png",
//                       width: 216,
//                       height: 100,
//                     ))
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../utils/styles_guide.dart';

class SliderHeroWidget extends StatelessWidget {
  const SliderHeroWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final List<String> sliderTexts = [
      "kt ma2, dr pd nyri pokemon mndng nyri jdh",
      "aq lg PIKACHU, Pkirn Kcaw Mkrn qm",
      "jst like Bulbasaur, you'll alwys be my nmber 1",
      "yu must be a Charmender, bcs you're mkng me hot",
      "PIKACHU, Pria Imut Kasep & Luchu",
    ];

    final List<String> sliderImages = [
      "assets/images/pokemon_together.png",
      "assets/images/pikachu.png",
      "assets/images/bulbasaur.png",
      "assets/images/hot.png",
      "assets/images/pikachu2.png",
    ];

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.13,
      // width: MediaQuery.of(context).size.width * 0.88,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: sliderTexts.length,
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
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            sliderTexts[index],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: myTextTheme.labelLarge?.copyWith(
                              color: whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Image.asset(
                        sliderImages[index],
                        width: 210,
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
