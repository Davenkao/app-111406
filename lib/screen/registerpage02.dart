import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_app/screen/loginpage.dart';
import 'package:sport_app/screen/registerpage.dart';
import 'package:sport_app/theme/color.dart';
import 'package:sport_app/utils/http_request.dart';

class RegisterPage02 extends StatefulWidget {
  const RegisterPage02({Key? key}) : super(key: key);
  static const String routeName = "/register02";

  @override
  State<RegisterPage02> createState() => _RegisterPage02State();
}

Widget _registerHeightTF(heightController) {
  //身高

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        '身高',
        style: TextStyle(
            color: primaryColor, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        height: 50,
        child: TextField(
          //keyboardType: TextInputType.emailAddress,
          style: const TextStyle(color: Colors.black),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(top: 10),
            prefixIcon: Icon(
              Icons.account_box_rounded,
              color: primaryColor,
            ),
            hintText: '公分',
            hintStyle: TextStyle(
              color: primaryColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: primaryColor,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: primaryColor,
                width: 1,
              ),
            ),
          ),
          controller: heightController,

          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
          ],
          keyboardType: TextInputType.number,
        ),
      ),
    ],
  );
}

Widget _registerWeightTF(weightController) {
  //體重

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        '體重',
        style: TextStyle(
          color: primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        height: 50,
        child: TextField(
          style: const TextStyle(color: Colors.black),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(top: 10),
            prefixIcon: Icon(Icons.account_box_rounded, color: primaryColor),
            hintText: '公斤',
            hintStyle: TextStyle(color: primaryColor),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 1),
            ),
          ),
          controller: weightController,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
          ],
          keyboardType: TextInputType.number,
        ),
      ),
    ],
  );
}

Widget _RegisterBirTF(birthdayController, context) {
  //生日

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        '生日',
        style: TextStyle(
            color: primaryColor, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 10.0,
      ),
      Container(
        alignment: Alignment.centerLeft,
        height: 50,
        child: TextField(
          style: const TextStyle(color: Colors.black),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(top: 10),
            prefixIcon: Icon(
              Icons.account_box_rounded,
              color: primaryColor,
            ),
            hintText: '民國年/月/日',
            hintStyle: TextStyle(color: primaryColor),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 1),
            ),
          ),
          controller: birthdayController,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
        ),
      ),
    ],
  );
}

Widget _registerPreBtn(context) {
  return Container(
    alignment: Alignment.center,
    child: GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, RegisterPage.routeName);
      },
      child: const Text(
        '上一步',
        style: TextStyle(
          color: primaryColor,
          fontSize: 20,
          decoration: TextDecoration.underline,
        ),
      ),
    ),
  );
}

class _RegisterPage02State extends State<RegisterPage02> {
  String dropdownValue = '男';

  late String userId, password, email;

  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final birthdayController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/icon/logo01.png',
                      fit: BoxFit.contain,
                      width: 150,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      '註冊',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: primaryColor,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  _registerHeightTF(heightController),
                  const SizedBox(height: 10),
                  _registerWeightTF(weightController),
                  const SizedBox(height: 10),
                  _RegisterBirTF(birthdayController, context),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        '性別',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 62.5,
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.account_box_rounded,
                                color: primaryColor),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor, width: 1),
                            ),
                          ),
                          value: dropdownValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items:
                              <String>['男', '女'].map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    color: primaryColor,
                                    fontSize: 18,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    height: 90,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final height = heightController.text,
                            weight = weightController.text,
                            birthday = birthdayController.text;
                        String reqeustData = """{
                            "user_id": "$userId",
                            "password": "$password",
                            "email": "$email",
                            "gender": ${(dropdownValue == '男') ? 0 : 1},
                            "role": "N",
                            "height": $height,
                            "weight": $weight,
                            "birthday": "$birthday"
                          }""";
                        await HttpRequest()
                            .post(
                                '${HttpURL.host}/api/user/signup', reqeustData)
                            .then((response) {
                          _showAlertDialog(context, response['message']);
                        });
                      },
                      child: const Text(
                        '完成 / 返回登入',
                        style: TextStyle(fontSize: 24),
                      ),
                      style: ElevatedButton.styleFrom(primary: primaryColor),
                    ),
                  ),
                  _registerPreBtn(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getString("userId") ?? "";
    password = prefs.getString("password") ?? "";
    email = prefs.getString("email") ?? "";
  }

  // Show AlertDialog
  void _showAlertDialog(context, message) {
    // Init
    AlertDialog dialog = AlertDialog(
      title: Text(message),
      actions: [
        ElevatedButton(
          child: const Text("確認"),
          onPressed: () {
            Navigator.pushReplacementNamed(context, LoginPage.routeName);
          },
        ),
      ],
    );

    // Show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}
