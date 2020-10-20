import 'package:flutter/cupertino.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainViewState();
  }
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("BOM DIA"),
      ),
    );
  }
}
