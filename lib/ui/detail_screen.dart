import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dim"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.forward),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(CircleBorder()))),
        ],
      ),
    );
  }
}
