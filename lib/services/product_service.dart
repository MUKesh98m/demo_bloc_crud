import 'package:demo_bloc_crud/constant/app_preference.dart';
import 'package:demo_bloc_crud/constant/app_string.dart';
import 'package:demo_bloc_crud/model/product_list_model.dart';
import 'package:dio/dio.dart';

class ProductService {
  final Dio _dio = Dio();
  static const int _perPage = 3;

  Future<ProductListModel?> ProductList({
    required int page,
  }) async {
    try {
      final Response response = await _dio.get(
          "${AppString.baseApi}products?page=$page&per_page=$_perPage",
          options: Options(headers: {
            "Authorization":
                "Bearer ${AppPreference.getString(AppString.token)}"
          }));
      print(response.data);
      return ProductListModel.fromJson(response.data);
    } catch (e) {}
  }
}
