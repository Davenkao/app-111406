import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sport_app/screen/main_page.dart';
import 'package:sport_app/theme/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingPage extends StatefulWidget {
  static const String routeName = "/loading";

  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Timer? timer;
  int currentTimer = 0;
  bool isLogin = false;
  bool isTest = false;

  @override
  void initState() {
    super.initState();
    _asyncMethod();
  }

  _asyncMethod() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? loginloadingpage = prefs.getBool('loginloadingpage');
    bool? testloadingpage = prefs.getBool('testloadingpage');
    timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      currentTimer += 100;
      if (currentTimer >= 3000) {
        timer.cancel();
        if (loginloadingpage == true) {
          Navigator.pushReplacementNamed(context, Main.routeName);
          prefs.setBool('loginloadingpage', false);
          setState(() {
            loginloadingpage = false;
          });
        }
        // if (testloadingpage == true) {
        //   Navigator.pushReplacementNamed(context, TestResultPage.routeName);
        //   prefs.setBool('testloadingpage', false);
        //   setState(() {
        //     testloadingpage = false;
        //   });
        // }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 100),
            SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation(primaryColor),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '讀取中',
              style: TextStyle(
                color: secondColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
