import 'package:demo_bloc_crud/constant/app_string.dart';
import 'package:demo_bloc_crud/model/login_model.dart';
import 'package:dio/dio.dart';

class LoginService {
  final Dio _dio = Dio();

  Future<LoginModel?> userLogin({
    String? email,
    String? password,
  }) async {
    try {
      var data = {
        "email": email,
        "password": password,
      };
      final Response response = await _dio.post(
        "${AppString.baseApi}login",
        data: data,
      );

      print(response.data);

      return LoginModel.fromJson(response.data);
    } catch (e) {
      print(e);
    }

  }
}
