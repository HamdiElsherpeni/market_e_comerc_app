import 'package:flutter/material.dart';

class CoustemTextFormFeaild extends StatelessWidget {
  const CoustemTextFormFeaild({
    super.key,
    this.preIcon,
    this.sufIcon,
    this.txtHint,
  });
  final Icon? preIcon;
  final Icon? sufIcon;
  final String? txtHint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        style: TextStyle(color: Colors.blue, fontSize: 10),
        strutStyle: StrutStyle(height: 0),
        decoration: InputDecoration(
          prefixIcon: preIcon,
          suffixIcon: sufIcon,
          hintText: txtHint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 153, 171, 242).withOpacity(0.5),
            ),
          ),
      
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
