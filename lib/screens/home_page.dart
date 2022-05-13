import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:krish_works/misc/theme.dart';
import 'package:krish_works/screens/second_screen.dart';
import 'package:pinput/pinput.dart';
import 'package:pintextfield/pintextfield.dart';
//import 'package:pin_input_text_field/pin_input_text_field.dart';
//import 'package:passcode/passcode.dart';
//import 'package:pinput/pinput.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryClr,
          leading: IconButton(
              onPressed: () {
                dialogBox(context);
                print("object");
              },
              icon: Icon(Icons.settings)),
          flexibleSpace: Container(
            margin: EdgeInsets.only(top: 40, left: 200, right: 200, bottom: 10),
            height: 100,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(8)),
            child: TabBar(
                //isScrollable: true,
                unselectedLabelColor: Colors.white,
                labelColor: Colors.lightBlue,
                indicator: RectangularIndicator(
                    color: Colors.white,
                    bottomLeftRadius: 8,
                    bottomRightRadius: 8,
                    topLeftRadius: 8,
                    topRightRadius: 8,
                    horizontalPadding: 8,
                    verticalPadding: 5),
                tabs: [
                  Tab(
                    text: 'Home',
                  ),
                  Tab(text: 'About us'),
                  Tab(
                    text: 'Updates',
                  )
                ]),
          ),
        ),
        body: TabBarView(children: [
          WebView(
            zoomEnabled: true,
            initialUrl: "https://krishworks.com/",
          ),
          WebView(
            initialUrl: "https://krishworks.com/about",
          ),
          WebView(
            initialUrl: "https://krishworks.com/updates",
          ),
        ]),
      ),
    );
  }

  dialogBox(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: AlertDialog(
              contentPadding: EdgeInsets.zero,
              elevation: 24,
              title: Center(child: Text("Developer Passcode")),
              actions: <Widget>[
                Center(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                        height: 100,
                        width: 200,
                        child: passcode(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  static String password() {
    DateTime date = DateTime.now();

    var exp = DateFormat.yMd().format(date).toString();
    List<String> res = exp.split('/');
    final List<int> newList = res.map((e) => int.parse(e)).toList();
    var j = newList[0] * newList[1] * newList[2];

    print(j);

    return j.toString();
  }

  passcode() {
    final pinController = TextEditingController();
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Pinput(
      controller: pinController,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: (s) {
        return s == password() ? null : 'Pin is incorrect';
      },
      showCursor: true,
      length: 6,
      onCompleted: (pin) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SecondScreen()),
      ),
    );
  }
}
