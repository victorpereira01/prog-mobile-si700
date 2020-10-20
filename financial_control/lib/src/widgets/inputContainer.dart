import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputContainer extends StatefulWidget {
  final String labelName;

  final bool hide;

  final onSaved;

  InputContainer({@required this.labelName, @required this.onSaved, this.hide});

  @override
  State<StatefulWidget> createState() {
    return _InputContainerState();
  }
}

class _InputContainerState extends State<InputContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(top: 30, bottom: 10),
              child: Text(widget.labelName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          TextFormField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, right: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.deepPurple, width: 3))),
            obscureText: widget.hide,
            onSaved: widget.onSaved,
          ),
        ],
      ),
    );
  }
}
