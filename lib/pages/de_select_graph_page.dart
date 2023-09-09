import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/appbar_layout.dart';
import 'package:mutuo_mobile_app/templates/body_de_select_graph_layout.dart';

class DESelectGraphPage extends StatefulWidget {
  const DESelectGraphPage({Key? key}) : super(key: key);

  @override
  State<DESelectGraphPage> createState() => _DESelectGraphPageState();
}

class _DESelectGraphPageState extends State<DESelectGraphPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Styles.scaffoldBackgroundColor,
      appBar: AppBarLayout(title: "Statistiche in Gernania"),
      body: DEBodySelectGraphLayout(),
      // bottomNavigationBar: BotNavBarLayout()
    );
  }
}
