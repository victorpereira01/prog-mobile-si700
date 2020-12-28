import 'package:financial_control/src/views/home/addTransactionView.dart';
import 'package:financial_control/src/views/home/mainView.dart';
import 'package:financial_control/src/views/home/transactionsView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationView extends StatefulWidget {
  final int userId;

  NavigationView({this.userId});

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

    _pages = [MainView(), TransactionsView(), AddTransactionView()];
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
                icon: Icon(Icons.home), title: Text("home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.view_list), title: Text("transactions")),
            BottomNavigationBarItem(icon: Icon(Icons.add), title: Text("add")),
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
