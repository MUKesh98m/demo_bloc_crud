import 'package:demo_bloc_crud/constant/app_string.dart';
import 'package:demo_bloc_crud/model/profile_model.dart';
import 'package:demo_bloc_crud/view/screen/profile/profile_bloc/profile_bloc.dart';
import 'package:demo_bloc_crud/view/screen/profile/profile_bloc/profile_state.dart';
import 'package:demo_bloc_crud/view/screen/profile/update_profile/update_bloc.dart';
import 'package:demo_bloc_crud/view/screen/profile/update_profile/update_event.dart';
import 'package:demo_bloc_crud/view/widget/text_input.dart';
import 'package:demo_bloc_crud/widget/constant.dart';
import 'package:demo_bloc_crud/widget/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String? gender;
  final TextEditingController _birthdateController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is ProfileLoadedState) {
          _nameController.text = "${state.profileModel.user?.name.toString()}";
          _emailController.text =
              "${state.profileModel.user?.email.toString()}";
          _birthdateController.text =
              "${state.profileModel.user?.birthDate.toString()}";

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppString.editProfile,
                    style: TextStyle(
                        fontSize: 34,
                        color: AppColors.textColor,
                        fontFamily: 'Libre',
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // Text(state.profileModel.user?.name ?? ""),
                  SizedBox(

                    child: TextInputField(
                      myIcon: Icons.person,
                      hintText: AppString.firstName,
                      controller: _nameController,
                      validator: nameValidation,
                      OnClick: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(

                    child: TextInputField(
                      myIcon: Icons.person,
                      hintText: AppString.emailAddressText,
                      controller: _emailController,
                      validator: validateEmail,
                      OnClick: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
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
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.teal)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<UpdateBloc>(context).add(
                              UpdateDataEvent(
                                  _nameController.text,
                                  _emailController.text,
                                  _birthdateController.text,
                                  state.profileModel!.user?.id));
                        }
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child: const Text(AppString.update,
                            style: TextStyle(
                                color: AppColors.White, fontSize: 25)),
                      )),
                ],
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    ));
  }

  value(ProfileModel model) {}
}
