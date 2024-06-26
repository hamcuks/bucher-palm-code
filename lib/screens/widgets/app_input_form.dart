import 'package:flutter/material.dart';

class AppInputForm extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Function(String?)? onChanged;

  const AppInputForm({
    super.key,
    this.controller,
    this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
