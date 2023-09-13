import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flag/flag.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Dove stai comprando?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextButton.icon(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(25),
                  ),
                  onPressed: () {
                    if (kDebugMode) {
                      print("utente ha clickato su IT");
                    }
                    Navigator.pushNamed(context, "/IT");
                  },
                  icon: const Flag.fromString(
                    'IT',
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                    borderRadius: 25,
                  ),
                  label: const Text(
                    "IT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      // fontFamily: "Roboto-Medium",
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton.icon(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(30),
                  ),
                  onPressed: () {
                    if (kDebugMode) {
                      print("utente ha clickato su DE");
                    }
                    Navigator.pushNamed(context, "/DE");
                  },
                  icon: const Flag.fromString(
                    'DE',
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                    borderRadius: 25,
                  ),
                  label: const Text(
                    "DE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      // fontFamily: "Roboto-Medium",
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
