import 'package:flutter/material.dart';
import 'package:krish_works/misc/theme.dart';
import 'package:krish_works/screens/home_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  PageController pageController = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
            backgroundColor: primaryClr,
            title: Container(
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Homepage()),
                        );
                      },
                      child: Text("Close")),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Settings")
                ],
              ),
            )),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            NavigationRail(
              labelType: NavigationRailLabelType.all,
              backgroundColor: primaryClr,
              selectedIconTheme: IconThemeData(color: primaryClr),
              unselectedIconTheme: IconThemeData(color: Colors.white),
              selectedIndex: index,
              onDestinationSelected: (index) => setState(
                () => this.index = index,
              ),
              destinations: [
                NavigationRailDestination(
                    icon: Icon(Icons.photo_sharp),
                    label: Text(
                      "gallery",
                      style:
                          TextStyle(color: index != 0 ? primaryClr : textClr),
                    )),
                NavigationRailDestination(
                    icon: Icon(
                      Icons.contact_phone,
                    ),
                    label: Text(
                      "contact",
                      style:
                          TextStyle(color: index != 1 ? primaryClr : textClr),
                    ))
              ],
            ),
            Expanded(child: Builder(builder: (context) {
              if (pageController.hasClients) {
                pageController.animateToPage(index,
                    duration: Duration(
                      milliseconds: 50,
                    ),
                    curve: Curves.easeInOut);
              }

              return PageView(
                controller: pageController,
                scrollDirection: Axis.vertical,
                children: [
                  WebView(
                    initialUrl: "https://krishworks.com/gallery/",
                  ),
                  WebView(
                    initialUrl: "https://krishworks.com/contact/",
                  ),
                ],
              );
            })),
          ],
        ));
  }

  Widget buildPages(int i) {
    print(index.toString() + "okokokok");
    if (i == 0) {
      return WebView(
        initialUrl: "https://krishworks.com/gallery/",
      );
    } else {
      return WebView(
        initialUrl: "https://krishworks.com/contact/",
      );
    }
  }
}
