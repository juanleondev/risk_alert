import 'package:flutter/material.dart';

enum CustomTextFieldType { general, password }

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.title,
    this.hintText,
    this.suffixIcon,
    this.controller,
  })  : type = CustomTextFieldType.general,
        super(key: key);
  const CustomTextField.password({
    Key? key,
    required this.title,
    this.controller,
    this.hintText,
  })  : type = CustomTextFieldType.password,
        suffixIcon = null,
        super(key: key);
  final String title;
  final String? hintText;
  final Widget? suffixIcon;
  final CustomTextFieldType type;
  final TextEditingController? controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 6),
          child: Text(
            widget.title,
          ),
        ),
        TextField(
          controller: widget.controller,
          obscureText:
              widget.type == CustomTextFieldType.password && !showPassword,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: widget.type == CustomTextFieldType.password
                ? _getPasswordIcon()
                : widget.suffixIcon,
          ),
        )
      ],
    );
  }

  Widget _getPasswordIcon() {
    return IconButton(
      onPressed: () {
        setState(() {
          showPassword = !showPassword;
        });
      },
      icon: showPassword
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
    );
  }
}
