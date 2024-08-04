import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iti_g24_1/dummy_projects/ecommerce/presentation/login/widgets/custom_textfield.dart';
import 'package:iti_g24_1/dummy_projects/ecommerce/presentation/main/main_screen.dart';

import 'cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Get.offAll(const MainScreen());
        }
        if (state is LoginError) {
          Get.snackbar(
            "Error",
            state.msg,
            colorText: Colors.white,
            backgroundColor: Colors.red,
          );
        }
      },
      child: Scaffold(
        body: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 100,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/logo2.png"),
                    const SizedBox(
                      height: 100,
                    ),
                    CustomTextfield(
                      text: "Email Number",
                      controller: _emailController,
                      validator: (value) {
                        if (!value!.isEmail) {
                          return "Please enter a valid email";
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextfield(
                      text: "Password",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a valid password";
                        }
                      },
                      isPassword: true,
                      controller: _passwordController,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Forget Password?"),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.04,
                    ),
                    InkWell(
                      onTap: () {
                        if (_form.currentState!.validate()) {
                          context.read<LoginCubit>().login(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                        }
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          color: Color(0xFF40AA54),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            if (state is LoginLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Center(
                                child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ));
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Color(0xFF40AA54),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
