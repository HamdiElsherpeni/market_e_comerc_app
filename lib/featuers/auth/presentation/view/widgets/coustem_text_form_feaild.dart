import 'package:flutter/material.dart';

class CoustemTextFormFeaild extends StatelessWidget {
  const CoustemTextFormFeaild({
    super.key,
    this.preIcon,
    this.sufIcon,
    this.txtHint,
    this.controller,
    this.validator,
    this.obscureText = false,
  });

  final Icon? preIcon;
  final Icon? sufIcon;
  final String? txtHint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.blue, fontSize: 10),
        strutStyle: const StrutStyle(height: 0),
        decoration: InputDecoration(
          prefixIcon: preIcon,
          suffixIcon: sufIcon,
          hintText: txtHint,
          hintStyle: const TextStyle(fontSize: 10),
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
