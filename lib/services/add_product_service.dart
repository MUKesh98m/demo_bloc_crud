import 'package:demo_bloc_crud/constant/app_preference.dart';
import 'package:demo_bloc_crud/constant/app_string.dart';
import 'package:demo_bloc_crud/model/add_product_model.dart';
import 'package:demo_bloc_crud/model/login_model.dart';
import 'package:dio/dio.dart';

class AddProductService {
  final Dio _dio = Dio();

  Future<AddProductModel?> AddProduct({
    String? name,
    String? mrp,
    String? selling,
    String? description,
  }) async {
    try {
      var data = {
        "name": name,
        "mrp": mrp,
        "selling": selling,
        "description": description,
      };
      final Response response = await _dio.post("${AppString.baseApi}products",
          data: data,
          options: Options(headers: {
            "Authorization":
                "Bearer ${AppPreference.getString(AppString.token)}"
          }));
      print(response.data);

      return AddProductModel.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }
}
