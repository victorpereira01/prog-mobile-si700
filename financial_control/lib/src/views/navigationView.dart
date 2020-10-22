import 'package:financial_control/src/views/mainView.dart';
import 'package:financial_control/src/views/transactionsView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavigationView();
  }
}

class _NavigationView extends State<NavigationView> {
  int _currentPage;
  var _pages;

  @override
  void initState() {
    super.initState();

    _currentPage = 0;

    _pages = [MainView(), TransactionsView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_currentPage),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.1,
              blurRadius: 6,
              offset: Offset(0, -1))
        ]),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("SALVE")),
            BottomNavigationBarItem(
                icon: Icon(Icons.view_list), title: Text("CASA")),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 1,
          iconSize: 38,
          currentIndex: _currentPage,
          onTap: (int index) => setState(() => _currentPage = index),
        ),
      ),
    );
  }
}
