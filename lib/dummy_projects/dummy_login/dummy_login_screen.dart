import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_g24_1/dummy_projects/dummy_login/email_validation_extension.dart';

class DummyLoginScreen extends StatefulWidget {
  DummyLoginScreen({super.key});

  @override
  State<DummyLoginScreen> createState() => _DummyLoginScreenState();
}

class _DummyLoginScreenState extends State<DummyLoginScreen> {
  bool obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("Build");

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0, right: 30, left: 30),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/final-image.jpg",
                    height: 100,
                    key: UniqueKey(),
                    width: 100,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  "Welcome back",
                  key: UniqueKey(),
                  style: TextStyle(
                    color: Color(0xFFCE6F81),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  key: const Key('email2'),
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(
                    controller: _emailController,
                    key: const Key('email22'),
                    validator: (value) {
                      if (!value!.emailValid) {
                        return "Email isn't valid";
                      }
                    },
                    decoration: InputDecoration(
                      label: Text("Email"),
                      prefixIcon: Icon(Icons.email),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(
                    key: const Key('password22'),
                    controller: _passwordController,
                    obscureText: obscureText,
                    validator: (value) {
                      if (value!.length < 10) {
                        return "Password should be more than 10 letters";
                      }
                    },
                    decoration: InputDecoration(
                      label: Text("Password"),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          obscureText = !obscureText;
                          print("===========" + obscureText.toString());
                          setState(() {});
                        },
                        child: Icon(
                          obscureText
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash,
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forget Password?",
                      key: UniqueKey(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print("========= email is : " + _emailController.text);
                      print("========= password is : " +
                          _passwordController.text);
                    }
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "Login",
                        key: UniqueKey(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
