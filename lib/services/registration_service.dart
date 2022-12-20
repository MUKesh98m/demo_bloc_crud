import 'package:demo_bloc_crud/constant/app_string.dart';
import 'package:demo_bloc_crud/model/registration_model.dart';
import 'package:dio/dio.dart';

class RegisterService {
  final Dio _dio = Dio();

  Future<RegistrationModel?> userRegister({
    String? name,
    String? email,
    String? password,
    String? file,
    String? password_confirmation,
    String? birth_date,
    String? gender,
  }) async {
    try {
      var data = {
        "name": name,
        "email": email,
        "password": password,
        "file": file,
        "password_confirmation": password_confirmation,
        "birth_date": birth_date,
        "gender": gender,
      };
      final Response response = await _dio.post(
        "${AppString.baseApi}register",
        data: data,
      );
      print(name);
      print(response.data);
      return RegistrationModel.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }
}
