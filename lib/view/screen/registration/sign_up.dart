import 'dart:io';

import 'package:demo_bloc_crud/view/screen/login/sign_in.dart';
import 'package:demo_bloc_crud/view/screen/registration/registration_bloc/registraion_bloc.dart';
import 'package:demo_bloc_crud/view/screen/registration/registration_bloc/registraion_event.dart';
import 'package:demo_bloc_crud/view/screen/registration/registration_bloc/registraion_state.dart';
import 'package:demo_bloc_crud/view/widget/glich.dart';
import 'package:demo_bloc_crud/view/widget/text_input.dart';
import 'package:demo_bloc_crud/widget/constant.dart';
import 'package:demo_bloc_crud/widget/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _setasswordController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  File? _image;
  final picker = ImagePicker();
  String? gender;

  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _setasswordController.dispose();
    _birthdateController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  DateTime selectedDate = DateTime.now();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegistraionBloc, RegistraionState>(
        builder: (BuildContext context, state) {
          return Center(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GlithEffect(
                          child: const Text(
                        "Welcome To MjStore",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          getImage();
                          print(_image);
                        },
                        child: Stack(
                          children: [
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=740&t=st=1661227798~exp=1661228398~hmac=4d92d1b31bc4eeeecca52a2da11a98986333dd1dc7d203b8a3432e85a66d8913"),
                              backgroundColor: Colors.deepPurple,
                              radius: 60,
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white),
                                    child: Icon(
                                      Icons.edit,
                                      size: 20,
                                      color: Colors.black,
                                    )))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextInputField(
                            controller: _nameController,
                            myLabelText: 'Name',
                            hintText: 'Name',
                            validator: nameValidation,
                            myIcon: Icons.abc_outlined,
                            textInputType: TextInputType.name,
                            OnClick: () {},
                          ),
                        ),
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
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextInputField(
                            controller: _confirmpasswordController,
                            myLabelText: 'Confirm Password',
                            hintText: 'Confirm Password',
                            toHide: true,
                            myIcon: Icons.password,
                            validator: (validator) {
                              if (validator.isEmpty) {
                                return 'Enter Confirm Password';
                              }
                              if (validator != _setasswordController.text) {
                                return 'The passwords do not match';
                              }
                              return null;
                            },
                            textInputType: TextInputType.visiblePassword,
                            OnClick: () {},
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextInputField(
                            controller: _birthdateController,
                            myLabelText: 'BirthDate',
                            hintText: 'Enter BirthDate',
                            myIcon: Icons.calendar_month,
                            OnClick: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101));

                              if (pickedDate != null) {
                                print(pickedDate);
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(formattedDate);

                                setState(() {
                                  _birthdateController.text = formattedDate;
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
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
                                BlocProvider.of<RegistraionBloc>(context).add(
                                    RegisterDataEvent(
                                        _nameController.text,
                                        _emailController.text,
                                        _setasswordController.text,
                                        _image?.path,
                                        _confirmpasswordController.text,
                                        _birthdateController.text,
                                        "Male"));
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10),
                              child: const Text("Register",
                                  style: TextStyle(color: AppColors.White)),
                            )),
                      ),
                      RichText(
                        text: TextSpan(
                            text: ' Alredy On MjStore',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: [
                              WidgetSpan(
                                  child: SizedBox(
                                width: 10,
                              )),
                              TextSpan(
                                text: "Login",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignInScreen()));
                                  },
                              )
                            ]),
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
        },
        listener: (BuildContext context, Object? state) {
          if (state is RegistrationLoadedState) {
            const CircularProgressIndicator();

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignInScreen()));
          } else if (state is RegistrationLoadingState) {
            const CircularProgressIndicator();
          } else {
            const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
