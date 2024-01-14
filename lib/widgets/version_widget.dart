import 'package:flutter/material.dart';

import '../utils/styles_guide.dart';

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
          "Technology Graduates Program - 2023",
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
