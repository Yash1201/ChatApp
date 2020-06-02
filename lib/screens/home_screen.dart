import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello/utils/universal_variables.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController;
  int _page=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    double _labelFontSize = 10;
    return Scaffold(
      backgroundColor: UniversalVariables.blackColor,
      body: PageView(
          children: <Widget>[

            Center(child: Text("Chat List Screen", style: TextStyle(color: Colors.white),)),
            Center(child: Text("Call Logs", style: TextStyle(color: Colors.white),)),
            Center(child: Text("Contact Screen", style: TextStyle(color: Colors.white),)),

          ],

          controller: pageController,
          onPageChanged: onPageChanged,
//          physics: NeverScrollableScrollPhysics(),

        ),
        bottomNavigationBar :Container(
          child: Padding(padding: EdgeInsets.symmetric(vertical: 10),
            child: CupertinoTabBar(
              backgroundColor: UniversalVariables.blackColor,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat,
                    color: (_page == 0)
                      ? UniversalVariables.lightBlueColor
                        :UniversalVariables.greyColor
                  ),
                  title: Text(
                    "Chats",
                    style: TextStyle(
                      fontSize: _labelFontSize,
                        color: (_page == 0)
                            ? UniversalVariables.lightBlueColor
                            :UniversalVariables.greyColor
                    ),
                  )
                ),


                BottomNavigationBarItem(
                    icon: Icon(Icons.call,
                        color: (_page == 1)
                            ? UniversalVariables.lightBlueColor
                            :UniversalVariables.greyColor
                    ),
                    title: Text(
                      "Call",
                      style: TextStyle(
                          fontSize: _labelFontSize,
                          color: (_page == 1)
                              ? UniversalVariables.lightBlueColor
                              :UniversalVariables.greyColor
                      ),
                    )
                ),


                BottomNavigationBarItem(
                    icon: Icon(Icons.contacts,
                        color: (_page == 2)
                            ? UniversalVariables.lightBlueColor
                            :UniversalVariables.greyColor
                    ),
                    title: Text(
                      "Contact",
                      style: TextStyle(
                          fontSize: _labelFontSize,
                          color: (_page == 2)
                              ? UniversalVariables.lightBlueColor
                              :UniversalVariables.greyColor
                      ),
                    )
                ),
              ],
              onTap: navigationTapped,
              currentIndex: _page,
            ),

          ),
        )
    );
  }
}
