import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText(
      {Key? key,
      required this.controller,
      required this.hint,
      required this.labelText,
      this.isPassword = false})
      : super(key: key);
  final TextEditingController controller;
  final String hint;
  final String labelText;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width * .8,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue[100]),
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            labelText: labelText,
            border: InputBorder.none,
            fillColor: Colors.white),
      ),
    );
  }
}
