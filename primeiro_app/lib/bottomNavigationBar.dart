import 'package:flutter/material.dart';
import 'views.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyBottomNavigationBar();
  }
}

class _MyBottomNavigationBar extends State<MyBottomNavigationBar> {
  int _currentPage;
  var _pages;

  @override
  void initState() {
    super.initState();

    _currentPage = 0;

    _pages = [
      generateVictorView(),
      generateAlexandreView(),
      generateTrabalhoView()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bottom Navigation Bar",
      home: Scaffold(
        body: Center(
          child: _pages.elementAt(_currentPage),
        ),
        appBar: AppBar(
          title: Text("My Navigation Bottom Bar App"),
          backgroundColor: Colors.deepPurple,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.add_alert), title: Text("Victor")),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), title: Text("Alexandre")),
            BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text("App")),
          ],
          backgroundColor: Colors.deepPurple,
          iconSize: 32,
          unselectedItemColor: Colors.grey,
          fixedColor: Colors.white,
          currentIndex: _currentPage,
          onTap: (int index) => setState(() => _currentPage = index),
        ),
      ),
    );
  }
}
