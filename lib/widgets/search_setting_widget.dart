import 'package:final_projects_pokemon/ui/fav_pokemon_screen.dart';
import 'package:final_projects_pokemon/ui/search_screen.dart';
import 'package:flutter/material.dart';

import '../utils/styles_guide.dart';

class SearchSettingWidget extends StatelessWidget {
  const SearchSettingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Form(
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintText: "Search Pokemon",
                  hintStyle: myTextTheme.bodyLarge!.copyWith(color: greyColor3),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      borderSide: BorderSide.none),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: greyColor2,
                  ),
                ),
                readOnly: true,
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const SearchScreen();
                  },
                )),
              ),
            ),
          ),
          const SizedBox(width: 12.0),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const FavoritePokemonScreen();
                  },
                ),
              );
            },
            child: Container(
              height: 48.0,
              width: 48.0,
              decoration: const BoxDecoration(
                color: yellowColor1,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.favorite_outline, color: redColor1),
              ),
            ),
          )
        ],
      ),
    );
  }
}
