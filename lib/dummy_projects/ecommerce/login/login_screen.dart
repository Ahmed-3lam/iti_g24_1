import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 100,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/logo2.png"),
              SizedBox(
                height: 100,
              ),
              _buildTextField(text: "Phone Number"),
              SizedBox(
                height: 20,
              ),
              _buildTextField(
                text: "Password",
                isPassword: true,
              ),
              _buildTextField(
                text: "Password",
                isPassword: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String text,
    bool isPassword = false,
  }) {
    print("=============" + obscure.toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
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
            obscureText: obscure,
            decoration: InputDecoration(
              suffixIcon: isPassword
                  ? InkWell(
                      onTap: () {
                        obscure = !obscure;
                        setState(() {});
                      },
                      child: Icon(Icons.remove_red_eye))
                  : null,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
