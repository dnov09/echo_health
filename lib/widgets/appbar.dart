import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      title: appbarTitle(),
      backgroundColor: Colors.white,
      leading: IconButton(
        color: Colors.black,
        icon: Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }

  appbarTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 56),
      child: const Text.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'Echo',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                color: Colors.cyan,
              ),
            ),
            TextSpan(
              text: 'Health',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Roboto',
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
