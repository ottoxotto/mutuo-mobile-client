import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/appbar_layout.dart';
import 'package:mutuo_mobile_app/templates/body_it_select_layout.dart';

class ITSelectPage extends StatefulWidget {
  const ITSelectPage({Key? key}) : super(key: key);

  @override
  State<ITSelectPage> createState() => _ITSelectPageState();
}

class _ITSelectPageState extends State<ITSelectPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Styles.scaffoldBackgroundColor,
      appBar: AppBarLayout(title: "Mutuo in Italia"),
      body: ITBodySelectLayout(),
      // bottomNavigationBar: BotNavBarLayout()
    );
  }
}
