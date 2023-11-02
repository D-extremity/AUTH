import 'package:flutter/material.dart';

TextField textField(
    BuildContext context, String s, TextEditingController textController) {
  return TextField(
    controller: textController,
    decoration: InputDecoration(
      helperText: s,
      hintText: s,
      enabled: true,
      border: borderDesign(),
      enabledBorder: borderDesign(),
    ),
  );
}

onTapOutside(BuildContext context) {
  return FocusScope.of(context).requestFocus(FocusNode());
}

OutlineInputBorder borderDesign() {
  return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.cyanAccent));
}

//OTP Dialog Box
void showOTPDialog(
    {required TextEditingController controller,
    required BuildContext context,
    required VoidCallback onPressed}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Enter OTP"),
      content: Column(
        children: [
          TextField(
            controller: controller,
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: const Text("Submit"),
        ),
      ],
    ),
  );
}
