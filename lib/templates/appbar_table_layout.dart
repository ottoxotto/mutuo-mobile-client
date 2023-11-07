import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/styles.dart';

class AppBarTableLayout extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final ScrollController tableController;
   

  const AppBarTableLayout({
    Key? key,
    required this.title,
    required this.tableController,
  }) : super(key: key);

  @override
  State<AppBarTableLayout> createState() => _AppBarTableLayoutState();

  @override
  // todo implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}

class _AppBarTableLayoutState extends State<AppBarTableLayout> {
  bool isScrolledDown = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            // Navigator.pushNamed(context, "/home");
            Navigator.of(context).pop();
          },
          // icon: const Icon(Icons.home_rounded),
          icon: const ImageIcon(AssetImage("assets/icons/png/back-arrow.png"),
              // color: Colors.white,
              size: 20)),
      actions: [
        IconButton(
          icon: const ImageIcon(AssetImage("assets/icons/png/up_down_arrows.png"),
              // color: Colors.white,
              size: 20),
          onPressed: () {
            if (isScrolledDown) {
              // Scroll to the top
              widget.tableController.animateTo(
                0,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
              isScrolledDown = false;
            } else {
              // Scroll to the bottom
              widget.tableController.animateTo(
                widget.tableController.position.maxScrollExtent,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
              isScrolledDown = true;
            }
          },
        ),
        // IconButton(
        //   icon: const Icon(Icons.arrow_upward),
        //   onPressed: () {
        //     widget.tableController.animateTo(
        //       0,
        //       duration: const Duration(seconds: 1),
        //       curve: Curves.easeInOut,
        //     );
        //   },
        // ),
      ],
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
