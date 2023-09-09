import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/appbar_layout.dart';
import 'package:mutuo_mobile_app/templates/body_it_select_graph_layout.dart';

class ITSelectGraphPage extends StatefulWidget {
  const ITSelectGraphPage({Key? key}) : super(key: key);

  @override
  State<ITSelectGraphPage> createState() => _ITSelectGraphPageState();
}

class _ITSelectGraphPageState extends State<ITSelectGraphPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Styles.scaffoldBackgroundColor,
      appBar: AppBarLayout(title: "Statistiche in Italia"),
      body: ITBodySelectGraphLayout(),
      // bottomNavigationBar: BotNavBarLayout()
    );
  }
}
