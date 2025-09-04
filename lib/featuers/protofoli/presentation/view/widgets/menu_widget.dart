import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuWidget extends StatelessWidget {
  
  MenuWidget({
    super.key,
    required this.icon,
    required this.text,
    this.onPressed,
  });
  final Icon icon;
  final String text;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
        final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        icon,
        SizedBox(width: 10),
        TextButton(
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
            
              fontWeight: FontWeight.bold,color: isDark ?Colors.white: Colors.black
            ),
          ),
        ),
      ],
    );
  }
}
