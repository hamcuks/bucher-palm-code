import 'package:flutter/material.dart';

class AppInputForm extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Function(String?)? onFieldSubmitted;
  final VoidCallback? onFieldCleared;

  AppInputForm({
    super.key,
    this.controller,
    this.hintText,
    this.onFieldSubmitted,
    this.onFieldCleared,
  });

  final ValueNotifier<bool> isFilled = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: (value) {
        isFilled.value = value.isNotEmpty;

        if (value.isEmpty && onFieldCleared != null) {
          onFieldCleared!();
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.blue.shade100.withOpacity(0.5),
        hintStyle: TextStyle(color: Colors.blue.shade900),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blue.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blue.shade500, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blue.shade400),
        ),
        suffixIcon: ValueListenableBuilder(
          valueListenable: isFilled,
          builder: (context, state, child) {
            if (state) {
              return IconButton(
                onPressed: () {
                  isFilled.value = false;
                  controller?.clear();
                  controller?.text = "";

                  if (onFieldCleared != null) onFieldCleared!();
                },
                icon: const Icon(Icons.close),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
