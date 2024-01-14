import 'package:final_projects_pokemon/utils/styles_guide.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Screen pokemon"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(160.0),
                      bottomRight: Radius.circular(160.0)),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300.0,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 200,
                    width: 200,
                    color: blueColor1,
                  ),
                ),
              ],
            ),
            Text(
              "POKEMON",
              style:
                  myTextTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.stacked_bar_chart),
                      Text("Abilities"),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.stacked_bar_chart),
                      Text("Abilities"),
                    ],
                  ),
                ),
              ],
            ),
            const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Height:"),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 39.0,
                          decoration: BoxDecoration(
                            color: greyColor0,
                            border: Border.all(color: blackColor),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Text("100cm"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Weight:"),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 39.0,
                          decoration: BoxDecoration(
                              color: greyColor0,
                              border: Border.all(color: blackColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Height:"),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 39.0,
                          decoration: BoxDecoration(
                              color: greyColor0,
                              border: Border.all(color: blackColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Weight:"),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 39.0,
                          decoration: BoxDecoration(
                              color: greyColor0,
                              border: Border.all(color: blackColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
