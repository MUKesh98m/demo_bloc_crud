import 'package:demo_bloc_crud/constant/app_string.dart';
import 'package:demo_bloc_crud/model/profile_model.dart';
import 'package:demo_bloc_crud/view/screen/product_screen/add_product/add_products_bloc.dart';
import 'package:demo_bloc_crud/view/screen/product_screen/add_product/add_products_state.dart';
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

import 'add_product/add_products_event.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  String? gender;
  final TextEditingController _sellingController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _mrpController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AddProductsBloc, AddProductsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is AddProductsLoadedState) {
          // return Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: Form(
          //     key: _formKey,
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         const Text(
          //           AppString.addProduct,
          //           style: TextStyle(
          //               fontSize: 34,
          //               color: AppColors.textColor,
          //               fontFamily: 'Libre',
          //               fontWeight: FontWeight.w700),
          //         ),
          //         const SizedBox(
          //           height: 40,
          //         ),
          //         // Text(state.profileModel.user?.name ?? ""),
          //         SizedBox(
          //           child: TextInputField(
          //             myIcon: Icons.person,
          //             hintText: AppString.firstName,
          //             controller: _nameController,
          //             validator: nameValidation,
          //             OnClick: () {},
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 15,
          //         ),
          //         SizedBox(
          //           child: TextInputField(
          //             myIcon: Icons.person,
          //             hintText: AppString.emailAddressText,
          //             controller: _descriptionController,
          //             // validator: validateEmail,
          //             OnClick: () {},
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 15,
          //         ),
          //         SizedBox(
          //           child: TextInputField(
          //             myIcon: Icons.person,
          //             hintText: AppString.emailAddressText,
          //             controller: _mrpController,
          //             // validator: vali,
          //             OnClick: () {},
          //           ),
          //         ),
          //         const SizedBox(
          //           height: 15,
          //         ),
          //         SizedBox(
          //           child: TextInputField(
          //             myIcon: Icons.person,
          //             hintText: AppString.emailAddressText,
          //             controller: _sellingController,
          //             validator: validateEmail,
          //             OnClick: () {},
          //           ),
          //         ),
          //
          //         const SizedBox(
          //           height: 30,
          //         ),
          //         TextButton(
          //             style: const ButtonStyle(
          //                 backgroundColor:
          //                     MaterialStatePropertyAll(Colors.teal)),
          //             onPressed: () {
          //               if (_formKey.currentState!.validate()) {
          //                 BlocProvider.of<AddProductsBloc>(context).add(
          //                     AddProductDataEvent(
          //                         _nameController.text,
          //                         _mrpController.text,
          //                         _descriptionController.text,
          //                         _sellingController.text));
          //               }
          //             },
          //             child: Container(
          //               height: 40,
          //               alignment: Alignment.center,
          //               width: MediaQuery.of(context).size.width,
          //               child: const Text(AppString.update,
          //                   style: TextStyle(
          //                       color: AppColors.White, fontSize: 25)),
          //             )),
          //       ],
          //     ),
          //   ),
          // );
          return Text("data");
        } else {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.red,
          ));
        }
      },
    ));
  }

  value(ProfileModel model) {}
}
