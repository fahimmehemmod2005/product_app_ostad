import 'dart:convert';
import 'package:ostad_api_1/model/product_model.dart';
import 'package:ostad_api_1/urls/urls.dart';
import 'package:http/http.dart' as http;

class ProductController {

  List<Data> products = [];

  Future<void> getReadProduct() async {
    final url = Uri.parse(Urls.getReadProduct);
    final response = await http.get(url);

    print(
      'Status Code: ${response.statusCode} \n Response Body: ${response.body}',
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonResponse = jsonDecode(response.body);

      ReadProductModel model = ReadProductModel.fromJson(jsonResponse);

      products = model.data ?? [];
    }
  }
}
