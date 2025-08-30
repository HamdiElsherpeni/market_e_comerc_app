import 'package:flutter/material.dart';

class SwichBoutten extends StatefulWidget {
  final Function(bool)? onChanged; // هنا هنباصي الفنكشن

  const SwichBoutten({Key? key, this.onChanged}) : super(key: key);

  @override
  _SwichBouttenState createState() => _SwichBouttenState();
}

class _SwichBouttenState extends State<SwichBoutten> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Center(
        child: Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
            });

            if (widget.onChanged != null) {
              widget.onChanged!(value); // استدعاء الفنكشن اللي مبعوت من برّه
            }
          },
          activeColor: Colors.blue,
          inactiveThumbColor: Colors.grey,
        ),
      ),
    );
  }
}
 