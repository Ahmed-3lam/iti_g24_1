import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final String text;
  final bool? isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomTextfield({
    super.key,
    required this.text,
    this.isPassword,
    required this.controller,
    this.validator,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyle(fontSize: 14, color: Color(0xFF8B8B97)),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.grey[200]),
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.isPassword != null ? obscure : false,
            validator: widget.validator,
            decoration: InputDecoration(
              suffixIcon: widget.isPassword != null
                  ? InkWell(
                      onTap: () {
                        obscure = !obscure;
                        setState(() {});
                      },
                      child: Icon(
                        obscure
                            ? Icons.remove_red_eye
                            : CupertinoIcons.eye_slash,
                      ))
                  : null,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
