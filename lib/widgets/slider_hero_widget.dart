import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
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
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: sliderTexts.length,
        itemBuilder: (context, index) {
          return FutureBuilder(
              future: PaletteGenerator.fromImageProvider(
                AssetImage(sliderImages[index]),
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.data != null) {
                  Color dominantColor = snapshot.data!.dominantColor!.color;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Stack(
                      children: [
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: dominantColor,
                            borderRadius: const BorderRadius.all(
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
                }
                return const SizedBox();
              });
        },
      ),
    );
  }
}
