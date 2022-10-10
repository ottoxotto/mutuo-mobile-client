import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/styles.dart';

class AppBarLayout extends StatefulWidget with PreferredSizeWidget {
  final String title;

  const AppBarLayout({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<AppBarLayout> createState() => _AppBarLayoutState();

  @override
  // todo implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}

class _AppBarLayoutState extends State<AppBarLayout> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, "/home");
        },
        icon: const Icon(Icons.home_rounded),
        color: Colors.white,
      ),
      backgroundColor: Styles.bgColor,
      title: Text(
        widget.title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20.0,
        ),
      ),
      centerTitle: true,
      elevation: 0,
    );
  }

  // @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
