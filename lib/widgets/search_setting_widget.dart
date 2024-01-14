import 'dart:developer';

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
                  hintStyle: myTextTheme.bodyLarge,
                  filled: true,
                  fillColor: greyColor1,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      borderSide: BorderSide.none),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: whiteColor,
                  ),
                ),
                readOnly: true,
                onTap: () => Navigator.pushNamed(context, "/searchscreen"),
              ),
            ),
          ),
          const SizedBox(width: 12.0),
          InkWell(
            onTap: () {
              log("Button Setting");
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
              child: const Icon(
                Icons.settings_input_composite_outlined,
                color: greyColor3,
              ),
            ),
          )
        ],
      ),
    );
  }
}
