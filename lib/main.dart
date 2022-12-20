import 'dart:io';
import 'package:demo_bloc_crud/constant/app_string.dart';
import 'package:demo_bloc_crud/services/login_Service.dart';
import 'package:demo_bloc_crud/services/product_service.dart';
import 'package:demo_bloc_crud/services/profile_service.dart';
import 'package:demo_bloc_crud/services/registration_service.dart';
import 'package:demo_bloc_crud/services/update_service.dart';
import 'package:demo_bloc_crud/view/screen/home_screen.dart';
import 'package:demo_bloc_crud/view/screen/login/login_bloc/login_bloc.dart';
import 'package:demo_bloc_crud/view/screen/login/sign_in.dart';
import 'package:demo_bloc_crud/view/screen/product_screen/Product_list/product_bloc.dart';
import 'package:demo_bloc_crud/view/screen/product_screen/Product_list/product_event.dart';
import 'package:demo_bloc_crud/view/screen/product_screen/add_product/add_products_bloc.dart';
import 'package:demo_bloc_crud/view/screen/profile/profile_bloc/profile_bloc.dart';
import 'package:demo_bloc_crud/view/screen/profile/profile_bloc/profile_event.dart';
import 'package:demo_bloc_crud/view/screen/profile/update_profile/update_bloc.dart';
import 'package:demo_bloc_crud/view/screen/registration/registration_bloc/registraion_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constant/app_preference.dart';
import 'services/add_product_service.dart';

void main() {
  runApp(MyApp());
  AppPreference.init();

  HttpOverrides.global = MyHttpOverrides();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<RegistraionBloc>(
            create: (context) => RegistraionBloc(RegisterService()),
          ),
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(LoginService()),
          ),
          BlocProvider<ProductBloc>(
            create: (context) =>
                ProductBloc(ProductService())..add(ProductDataEvent()),
          ),
          BlocProvider<ProfileBloc>(
            create: (context) =>
                ProfileBloc(ProfileService())..add(ProfileDataEvent()),
          ),
          BlocProvider<UpdateBloc>(
            create: (context) => UpdateBloc(UpdateService()),
          ),
          BlocProvider<AddProductsBloc>(
            create: (context) => AddProductsBloc(AddProductService()),
          )
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            useInheritedMediaQuery: true,
            debugShowCheckedModeBanner: false,
            home: AppPreference.getBool(AppString.status) == true
                ? HomeScreen()
                : SignInScreen()));
    // return MaterialApp(
    //     home: RepositoryProvider(
    //         create: (context) => ProductService(),
    //         child: AppPreference.getBool(AppString.status) == true
    //             ? HomeScreen()
    //             : SignInScreen()));
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
