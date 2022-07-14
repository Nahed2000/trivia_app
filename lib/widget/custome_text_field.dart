import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.textController,
      required this.label,
      required this.preIcon,
      required this.keyboard,
      this.sufIcon,
      this.sufPress,
      this.isSecured})
      : super(key: key);

  final TextEditingController textController;
  final String label;
  final IconData preIcon;
  final IconData? sufIcon;
  final bool? isSecured;
  final void Function()? sufPress;
  final TextInputType keyboard;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.grey,
      controller: textController,
      keyboardType: keyboard,
      obscureText: isSecured ?? false,
      decoration: InputDecoration(
        label: Text(label),
        focusColor: Colors.grey,
        focusedBorder: const UnderlineInputBorder(
          borderSide:  BorderSide(
            color: Colors.grey
          )
        ),
        // fillColor: Colors.grey,
        // filled: true,
        prefixIcon: Icon(preIcon,color: Colors.black,),
        labelStyle: const TextStyle(
          color: Colors.grey
        ),
        suffixIcon: IconButton(
          icon: Icon(sufIcon),
          onPressed: sufPress,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
    );
  }
}
