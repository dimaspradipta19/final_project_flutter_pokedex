import 'package:flutter/material.dart';

class NavbarDetailScreenWidget extends StatelessWidget {
  const NavbarDetailScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  size: 35.0,
                )),
            SizedBox(
              width: 35,
              height: 35,
              child: Image.asset("assets/images/pokeball.png"),
            ),
          ],
        ),
      ),
    );
  }
}
