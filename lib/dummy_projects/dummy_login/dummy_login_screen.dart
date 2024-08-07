import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iti_g24_1/dummy_projects/dummy_login/cubit/dummy_login_cubit.dart';
import 'package:iti_g24_1/dummy_projects/dummy_login/email_validation_extension.dart';

class DummyLoginScreen extends StatelessWidget {
  bool obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DummyLoginCubit>();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: BlocListener<DummyLoginCubit, DummyLoginState>(
        listener: (context, state) {
          if (state is DummyLoginSuccess) {
            Get.snackbar("Success", "Success", backgroundColor: Colors.green);
          }
          if (state is DummyLoginError) {
            Get.snackbar(
              "error",
              "Error",
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        },
        child: Padding(
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
                      width: 100,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Welcome back",
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
                    decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      controller: _emailController,
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
                      controller: _passwordController,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        label: Text("Password"),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: () {
                            obscureText = !obscureText;
                            print("===========" + obscureText.toString());
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
                        context.read<DummyLoginCubit>().login(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                      }
                    },
                    child: BlocBuilder<DummyLoginCubit, DummyLoginState>(
                      builder: (context, state) {
                        if (state is DummyLoginLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Method:PoST
///Path:https://student.valuxapps.com/api/login
/// body: email , password
/// headers: lang ,Content-Type: application/json
