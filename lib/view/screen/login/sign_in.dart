import 'package:demo_bloc_crud/constant/app_preference.dart';
import 'package:demo_bloc_crud/constant/app_string.dart';
import 'package:demo_bloc_crud/view/screen/home_screen.dart';
import 'package:demo_bloc_crud/view/screen/login/login_bloc/login_bloc.dart';
import 'package:demo_bloc_crud/view/screen/login/login_bloc/login_event.dart';
import 'package:demo_bloc_crud/view/screen/registration/sign_up.dart';
import 'package:demo_bloc_crud/widget/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widget/validation.dart';
import '../../widget/glich.dart';
import '../../widget/text_input.dart';
import 'login_bloc/login_state.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _setasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoadedState) {
            if (AppPreference.getBool(AppString.status) == true) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false,
              );
            } else {
              const CircularProgressIndicator();
            }
          } else if (state is LoginLoadingState) {
            const Center(child: CircularProgressIndicator());
          } else {
            Center(child: const CircularProgressIndicator());
          }
        },
        builder: (context, state) {
          if (state is LoginLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoginErrorState) {
            return const Center(child: Text("Error"));
          } else {
            return SafeArea(
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Container(
                    margin: const EdgeInsets.only(top: 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GlithEffect(
                            child: const Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextInputField(
                              controller: _emailController,
                              myLabelText: 'Email',
                              hintText: 'Email',
                              validator: validateEmail,
                              myIcon: Icons.email,
                              textInputType: TextInputType.emailAddress,
                              OnClick: () {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextInputField(
                              controller: _setasswordController,
                              myLabelText: 'Set Password',
                              hintText: 'Password',
                              toHide: true,
                              validator: validatePassword,
                              myIcon: Icons.password,
                              textInputType: TextInputType.visiblePassword,
                              OnClick: () {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: TextButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.teal)),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<LoginBloc>(context)
                                      .add(LoginDataEvent(
                                    _emailController.text,
                                    _setasswordController.text,
                                  ));
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 10),
                                child: const Text("Login",
                                    style: TextStyle(color: AppColors.White)),
                              )),
                        ),
                        const Text(
                          "Don't have an account yet ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: GlithEffect(
                              child: const Text(
                            "Create account",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          )),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
