import 'package:demo_bloc_crud/constant/app_string.dart';
import 'package:demo_bloc_crud/model/profile_model.dart';
import 'package:dio/dio.dart';

import '../constant/app_preference.dart';

class ProfileService {
  final Dio _dio = Dio();
  Future<ProfileModel?> profile() async {
    try {
      final Response response = await _dio.get(
          "${AppString.baseApi}getUserProfile",
          options: Options(headers: {
            "Authorization":
                "Bearer ${AppPreference.getString(AppString.token)}"
          }));
      print(response.data);
      return ProfileModel.fromJson(response.data);
    } catch (e) {}
  }
}
