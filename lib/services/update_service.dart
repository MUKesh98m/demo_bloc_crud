import 'package:demo_bloc_crud/constant/app_string.dart';
import 'package:demo_bloc_crud/model/registration_model.dart';
import 'package:demo_bloc_crud/model/update_profile_model.dart';
import 'package:dio/dio.dart';

import '../constant/app_preference.dart';

class UpdateService {
  final Dio _dio = Dio();

  Future<UpdateProfileModel?> userUpdate(
      {String? name, String? email, String? birth_date, int? id}) async {
    try {
      var data = {
        "name": name,
        "email": email,
        "birth_date": birth_date,
      };
      final Response response = await _dio.put(
        "${AppString.baseApi}profileUpdate/$id",
        data: data,
          options: Options(headers: {
            "Authorization":
            "Bearer ${AppPreference.getString(AppString.token)}"
          }));

      // print(name);
      print(response.data);
      return UpdateProfileModel.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }
}
