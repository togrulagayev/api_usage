import 'package:api_usage/models/products_fakestore.dart';
import 'package:dio/dio.dart';

Future<List<ApiUsage>?> getFakeStoreProductsWithDio() async {
  var url = 'https://api.escuelajs.co/api/v1/products';
  var res = await Dio().get(url);

  try {
    if (res.statusCode == 200) {
      var body = res.data as List;
      return body.map((e) => ApiUsage.fromJson(e)).toList();
    }
    // ignore: avoid_print
    print(res.statusCode);
  } catch (e) {
    // ignore: avoid_print
    print('Sehv var: $e');
  }
  return [];
}
