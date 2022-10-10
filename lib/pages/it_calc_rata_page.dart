import 'package:flutter/material.dart';
import 'package:mutuo_mobile_app/templates/appbar_layout.dart';
import 'package:mutuo_mobile_app/templates/body_calc_rata_layout.dart';
import 'package:mutuo_mobile_app/templates/botnavbar_layout.dart';

// Future callApI(apiName) async {
//   var url = "http://10.0.2.2:5000/$apiName";
//   final response =
//       await http.post(Uri.parse(url), body: json.encode(userEntry));
//   final decoded = json.decode(response.body) as Map<String, dynamic>;
//   data_table = decoded;
// }

class ITCalcRataPage extends StatefulWidget {
  const ITCalcRataPage({Key? key}) : super(key: key);

  @override
  State<ITCalcRataPage> createState() => _ITCalcRataPageState();
}

class _ITCalcRataPageState extends State<ITCalcRataPage> {
  // int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });

  //   if (_selectedIndex == 0) {
  //     Navigator.popUntil(context, ModalRoute.withName('/home'));
  //   } else if (_selectedIndex == 1) {
  //     callApI("outMutuo");
  //     Navigator.pushNamed(context, "/OVTable");
  //   } else if (_selectedIndex == 2) {
  //     callApI("outMutuoAvg");
  //     Navigator.pushNamed(context, "/OVTable");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // backgroundColor: Styles.scaffoldBackgroundColor,
        appBar: AppBarLayout(title: "Mutuo in Italia"),
        body: ITBodyCalcLayout(),
        bottomNavigationBar: BotNavBarLayout());
  }
}
