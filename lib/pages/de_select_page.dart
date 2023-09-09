import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/appbar_layout.dart';
import 'package:mutuo_mobile_app/templates/body_de_select_layout.dart';

class DESelectPage extends StatefulWidget {
  const DESelectPage({Key? key}) : super(key: key);

  @override
  State<DESelectPage> createState() => _DESelectPageState();
}

class _DESelectPageState extends State<DESelectPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Styles.scaffoldBackgroundColor,
      appBar: AppBarLayout(title: "Mutuo in Germania"),
      body: DEBodySelectLayout(),
      // bottomNavigationBar: BotNavBarLayout()
    );
  }
}
