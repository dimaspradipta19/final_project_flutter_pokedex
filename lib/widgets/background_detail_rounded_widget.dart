import 'package:flutter/material.dart';

class BackgroundDetailRoundedWidget extends StatelessWidget {
  const BackgroundDetailRoundedWidget({
    super.key,
    required this.dominantColor,
  });

  final Color dominantColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(100.0),
          bottomRight: Radius.circular(100.0)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 300.0,
        decoration: BoxDecoration(
          color: dominantColor,
        ),
      ),
    );
  }
}
