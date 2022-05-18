import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:math' as math;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_app/enum/record_type.dart';
import 'package:sport_app/enum/training_part.dart';
import 'package:sport_app/screen/testpage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

Widget _Drawer(BuildContext context) {
  Color primaryColor = HexColor("7C9C99");
  Color secondColor = HexColor("4E605E");
  Color thirdColor = HexColor("AAD4D0");
  return Container(
    width: MediaQuery.of(context).size.width / 1.8,
    child: Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 12),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/icon/logo01.png',
                          width: 150,
                        ),
                        Text(
                          "肌動GO",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            // fontFamily: 'OpenSans',
                            color: primaryColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 8),
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  ListTile(
                    title: Text(
                      "使用須知",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        // fontFamily: 'OpenSans',
                        color: secondColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      "關於我們",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        // fontFamily: 'OpenSans',
                        color: secondColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      "修改密碼",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        // fontFamily: 'OpenSans',
                        color: secondColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ))
            ],
          )),
    ),
  );
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  Color primaryColor = HexColor("7C9C99");
  Color secondColor = HexColor("4E605E");
  Color thirdColor = HexColor("AAD4D0");

  bool _normalHasBeenPressed = true;
  bool _visionHasBeenPressed = false;
  // Color controllerColor = ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      key: _key,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 70 + 1,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () => _key.currentState!.openDrawer(),
        ),
        title: Text('肌動GO'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.ring_volume,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ColumnSuper(
            innerDistance: MediaQuery.of(context).size.height / -3.0,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Stack(children: <Widget>[
                  Positioned(
                      top: -200,
                      left: -75,
                      child: Transform.rotate(
                        angle: -1 * (math.pi / 180),
                        child: SvgPicture.asset('assets/icon/tangle.svg',
                            semanticsLabel: 'bkgrdrectangle'),
                      )),
                ]),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 0,
                  left: 0,
                ),
                width: MediaQuery.of(context).size.width / 1.3,
                height: MediaQuery.of(context).size.height / 5.3,
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 25, left: 40),
                          child: RawMaterialButton(
                            onPressed: () {},
                            elevation: 2.0,
                            fillColor: Colors.white,
                            child: Icon(
                              Icons.account_box_rounded,
                              size: 45,
                              color: secondColor,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, left: 40),
                          child: Text(
                            '個人資訊',
                            style: TextStyle(
                              fontSize: 20,
                              color: secondColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 22,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            '身高: 170CM',
                            style: TextStyle(
                                fontSize: 20,
                                color: secondColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(),
                          child: Text(
                            '體重: 70KG',
                            style: TextStyle(
                                fontSize: 20,
                                color: secondColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            'BMI: 24.2',
                            style: TextStyle(
                                fontSize: 20,
                                color: secondColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.help_outline_sharp,
                      size: 45,
                      color: primaryColor,
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  ),
                  Container(
                    child: Text(
                      '使用教學',
                      style: TextStyle(
                        fontSize: 20,
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.insert_chart_outlined_outlined,
                      size: 45,
                      color: primaryColor,
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  ),
                  Container(
                    child: Text(
                      '檢視資料',
                      style: TextStyle(
                        fontSize: 20,
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.report_gmailerrorred_rounded,
                      size: 45,
                      color: primaryColor,
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  ),
                  Container(
                    child: Text(
                      '健康資訊',
                      style: TextStyle(
                        fontSize: 20,
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.height / 11,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blueAccent)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
                top: 10, left: MediaQuery.of(context).size.width / 11),
            child: Text(
              '測試項目',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: secondColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  RawMaterialButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      //intropage判斷教學引導用
                      await prefs.setBool('normalmode', _normalHasBeenPressed);
                      await prefs.setBool('upmode', true);
                      await prefs.setBool('twohead', true);
                      //
                      await prefs.setInt("part", TrainingPart.biceps.value);
                      //待更改
                      await prefs.setInt("type", RecordType.examination.value);
                      //Navigator.of(context).pushNamed('intro_page'); //此為跳轉至intropage 我先不改哲寫的
                      Navigator.pushNamed(context, TestPage.routeName);
                    },
                    elevation: 2.0,
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.help_outline_sharp,
                      size: 45,
                      color: primaryColor,
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  ),
                  Container(
                    child: Text(
                      '二頭肌',
                      style: TextStyle(
                        fontSize: 20,
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  RawMaterialButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      //intropage判斷教學引導用
                      await prefs.setBool('normalmode', _normalHasBeenPressed);
                      await prefs.setBool('upmode', true);
                      await prefs.setBool('twohead', false);
                      //
                      await prefs.setInt("part", TrainingPart.deltoid.value);

                      //待更改
                      await prefs.setInt("type", RecordType.examination.value);
                      //Navigator.of(context).pushNamed('intro_page'); //此為跳轉至intropage 我先不改哲寫的
                      Navigator.pushNamed(context, TestPage.routeName);
                    },
                    elevation: 2.0,
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.insert_chart_outlined_outlined,
                      size: 45,
                      color: primaryColor,
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  ),
                  Container(
                    child: Text(
                      '三頭肌',
                      style: TextStyle(
                        fontSize: 20,
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  RawMaterialButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      //intropage判斷教學引導用
                      await prefs.setBool('normalmode', _normalHasBeenPressed);
                      await prefs.setBool('upmode', false);
                      await prefs.setBool('twohead', false);
                      //
                      await prefs.setInt("part", TrainingPart.quadriceps.value);

                      //待更改
                      await prefs.setInt("type", RecordType.examination.value);
                      //Navigator.of(context).pushNamed('intro_page'); //此為跳轉至intropage 我先不改哲寫的
                      Navigator.pushNamed(context, TestPage.routeName);
                    },
                    elevation: 2.0,
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.report_gmailerrorred_rounded,
                      size: 45,
                      color: primaryColor,
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  ),
                  Container(
                    child: Text(
                      '滑牆深蹲',
                      style: TextStyle(
                        fontSize: 20,
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _normalHasBeenPressed = true;
                      _visionHasBeenPressed = false;
                    });
                  },
                  child: Text(
                    "一般模式",
                    style: const TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: _normalHasBeenPressed ? primaryColor : thirdColor,
                    elevation: 5,
                  ),
                ),
              ),
              SizedBox(
                width: 35,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _normalHasBeenPressed = false;
                      _visionHasBeenPressed = true;
                    });
                  },
                  child: Text(
                    "視覺辨識",
                    style: const TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: _visionHasBeenPressed ? primaryColor : thirdColor,
                    elevation: 5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: _Drawer(context),
    );
  }
}
