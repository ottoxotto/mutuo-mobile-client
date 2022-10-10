import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/appbar_layout.dart';
import 'package:mutuo_mobile_app/templates/body_it_select_layout.dart';

class Italia extends StatefulWidget {
  const Italia({Key? key}) : super(key: key);

  @override
  State<Italia> createState() => _ItaliaState();
}

class _ItaliaState extends State<Italia> {
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
